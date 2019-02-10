"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const path = require("path");
const fs = require("fs");
const yaml_1 = require("yaml");
// Copy from https://github.com/rust-lang/rls-vscode/blob/master/src/tasks.ts
function registerCrystalTask(context) {
    vscode_1.workspace.onDidOpenTextDocument((doc) => DidOpenTextDocument(doc, context));
    vscode_1.workspace.textDocuments.forEach((doc) => DidOpenTextDocument(doc, context));
    vscode_1.workspace.onDidChangeWorkspaceFolders((e) => didChangeWorkspaceFolders(e, context));
}
exports.registerCrystalTask = registerCrystalTask;
function DidOpenTextDocument(document, context) {
    if (document.languageId !== 'crystal') {
        return;
    }
    const uri = document.uri;
    let folder = vscode_1.workspace.getWorkspaceFolder(uri);
    if (!folder) {
        return;
    }
    folder = getOuterMostWorkspaceFolder(folder);
    if (!workspaces.has(folder.uri.toString())) {
        const client = new CrystalTaskClient(folder);
        workspaces.set(folder.uri.toString(), client);
        client.start(context);
    }
}
exports.DidOpenTextDocument = DidOpenTextDocument;
function getOuterMostWorkspaceFolder(folder) {
    const sorted = sortedWorkspaceFolders();
    for (const element of sorted) {
        let uri = folder.uri.toString();
        if (uri.charAt(uri.length - 1) !== '/') {
            uri = uri + '/';
        }
        if (uri.startsWith(element)) {
            return vscode_1.workspace.getWorkspaceFolder(vscode_1.Uri.parse(element)) || folder;
        }
    }
    return folder;
}
exports.getOuterMostWorkspaceFolder = getOuterMostWorkspaceFolder;
// This is an intermediate, lazy cache used by `getOuterMostWorkspaceFolder`
// and cleared when VSCode workspaces change.
let _sortedWorkspaceFolders;
function sortedWorkspaceFolders() {
    if (!_sortedWorkspaceFolders && vscode_1.workspace.workspaceFolders) {
        _sortedWorkspaceFolders = vscode_1.workspace.workspaceFolders.map(folder => {
            let result = folder.uri.toString();
            if (result.charAt(result.length - 1) !== '/') {
                result = result + '/';
            }
            return result;
        }).sort((a, b) => {
            return a.length - b.length;
        });
    }
    return _sortedWorkspaceFolders || [];
}
exports.sortedWorkspaceFolders = sortedWorkspaceFolders;
function didChangeWorkspaceFolders(e, context) {
    _sortedWorkspaceFolders = undefined;
    // If a VSCode workspace has been added, check to see if it is part of an existing one, and
    // if not, and it is a Rust project (i.e., has a Cargo.toml), then create a new client.
    for (let folder of e.added) {
        folder = getOuterMostWorkspaceFolder(folder);
        if (workspaces.has(folder.uri.toString())) {
            continue;
        }
        const client = new CrystalTaskClient(folder);
        workspaces.set(folder.uri.toString(), client);
        client.start(context);
    }
    // If a workspace is removed which is a Crystal workspace, kill the client.
    for (const folder of e.removed) {
        const client = workspaces.get(folder.uri.toString());
        if (client) {
            workspaces.delete(folder.uri.toString());
            client.stop();
        }
    }
}
exports.didChangeWorkspaceFolders = didChangeWorkspaceFolders;
const workspaces = new Map();
class CrystalTaskClient {
    constructor(folder) {
        this.folder = folder;
        this.disposables = [];
    }
    start(context) {
        return __awaiter(this, void 0, void 0, function* () {
            this.disposables.push(this.registerTaskProvider());
        });
    }
    stop() {
        return __awaiter(this, void 0, void 0, function* () {
            let promise = Promise.resolve(void 0);
            return promise.then(() => {
                this.disposables.forEach(d => d.dispose());
            });
        });
    }
    registerTaskProvider() {
        let provider = new CrystalTaskProvider(this.folder);
        const disposable = vscode_1.workspace.registerTaskProvider('crystal', provider);
        return disposable;
    }
}
class CrystalTaskProvider {
    constructor(_workspaceFolder) {
        this._workspaceFolder = _workspaceFolder;
    }
    provideTasks() {
        return getCrystalTasks(this._workspaceFolder);
    }
    resolveTask(_task) {
        return undefined;
    }
}
function getCrystalTasks(target) {
    const taskList = createCrystalTaskConfigItem(target);
    const list = taskList.map((def) => {
        const task = createCrystalTask(def, target);
        return task;
    });
    return list;
}
function createCrystalTask({ definition, group, presentationOptions, problemMatcher }, target) {
    let taskBin = getCrystalCompiler(target);
    let taskArgs = (definition.args !== undefined) ? definition.args : [];
    if (definition.file !== undefined) {
        taskArgs.push(definition.file);
    }
    let source = 'Crystal';
    if (definition.type !== 'crystal') {
        taskBin = getShardsPath(target);
        source = 'Shards';
    }
    const execCmd = `${taskBin} ${definition.command} ${taskArgs}`;
    const execOption = {
        cwd: target.uri.fsPath
    };
    const exec = new vscode_1.ShellExecution(execCmd, execOption);
    let label = definition.label;
    if (definition.type == 'crystal' && definition.file !== undefined) {
        label = `${label} - ${definition.file}`;
    }
    const task = new vscode_1.Task(definition, target, label, source, exec, problemMatcher);
    if (group !== undefined) {
        task.group = group;
    }
    if (presentationOptions !== undefined) {
        task.presentationOptions = presentationOptions;
    }
    return task;
}
const CRYSTAL_TASKS = [
    {
        type: 'crystal',
        command: 'run',
        group: vscode_1.TaskGroup.Build
    },
    {
        type: 'crystal',
        command: 'docs',
        group: vscode_1.TaskGroup.Clean
    },
    {
        type: 'crystal',
        command: 'tool format',
        group: vscode_1.TaskGroup.Clean
    },
    {
        type: 'crystal',
        command: 'spec',
        group: vscode_1.TaskGroup.Test
    },
    {
        type: 'shards',
        command: 'install',
        group: vscode_1.TaskGroup.Build
    },
    {
        type: 'shards',
        command: 'update',
        group: vscode_1.TaskGroup.Build
    },
    {
        type: 'shards',
        command: 'build',
        args: [
            '--release'
        ],
        group: vscode_1.TaskGroup.Build
    },
    {
        type: 'shards',
        command: 'prune',
        group: vscode_1.TaskGroup.Clean
    }
];
function createCrystalTaskConfigItem(target) {
    const problemMatcher = [];
    const presentationOptions = {
        reveal: vscode_1.TaskRevealKind.Always,
        panel: vscode_1.TaskPanelKind.Dedicated,
    };
    const mainFile = getMainFile(target);
    const tasks = CRYSTAL_TASKS.map((opt) => {
        const def = {
            label: opt.command,
            type: opt.type,
            command: opt.command,
            args: opt.args,
        };
        if (opt.type == 'crystal' && opt.group == vscode_1.TaskGroup.Build) {
            def.file = mainFile;
        }
        const task = {
            definition: def,
            problemMatcher,
            group: def.group,
            presentationOptions
        };
        return task;
    });
    return tasks;
}
function getCrystalCompiler(folder) {
    return vscode_1.workspace.getConfiguration('crystal-lang', folder.uri).get('compiler', 'crystal');
}
function getShardsPath(folder) {
    return vscode_1.workspace.getConfiguration('crystal-lang', folder.uri).get('shards', 'shards');
}
function getMainFile(folder) {
    const shardFile = getShardFile();
    if (fs.existsSync(shardFile)) {
        const io = fs.readFileSync(shardFile, 'utf8');
        const data = yaml_1.default.parse(io);
        if (data.targets !== undefined) {
            const values = Object.keys(data.targets).map(key => data.targets[key]);
            // NOTE: match first targets
            if (values.length > 0) {
                return values[0].main;
            }
        }
    }
    const defaultMainFile = vscode_1.workspace.getConfiguration('crystal-lang', folder.uri).get('mainFile', 'main.cr');
    return defaultMainFile;
}
function getShardFile() {
    const workspaceRoot = vscode_1.workspace.rootPath;
    const shardFile = path.join(workspaceRoot, 'shard.yml');
    return shardFile;
}
//# sourceMappingURL=crystalTasks.js.map