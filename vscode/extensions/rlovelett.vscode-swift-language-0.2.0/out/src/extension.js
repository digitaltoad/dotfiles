'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const vscode_languageclient_1 = require("vscode-languageclient");
// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
function activate(context) {
    // Load the path to the language server from settings
    let executableCommand = vscode_1.workspace.getConfiguration("swift")
        .get("languageServerPath", "/usr/local/bin/LanguageServer");
    let run = { command: executableCommand };
    let debug = run;
    let serverOptions = {
        run: run,
        debug: debug
    };
    // client extensions configure their server
    let clientOptions = {
        documentSelector: [
            { language: 'swift', scheme: 'file' },
            { language: 'swift', scheme: 'untitled' }
        ],
        synchronize: {
            configurationSection: 'swift',
            fileEvents: [
                vscode_1.workspace.createFileSystemWatcher('**/*.swift', false, true, false),
                vscode_1.workspace.createFileSystemWatcher('**/.build/{debug,release}.yaml', false, false, false)
            ]
        }
    };
    let client = new vscode_languageclient_1.LanguageClient('Swift', serverOptions, clientOptions);
    // Push the disposable to the context's subscriptions so that the
    // client can be deactivated on extension deactivation
    context.subscriptions.push(client.start());
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map