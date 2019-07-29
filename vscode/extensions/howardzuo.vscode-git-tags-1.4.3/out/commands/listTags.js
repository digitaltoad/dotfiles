"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = __importStar(require("vscode"));
let panel;
function listCMD(context, provider, refreshTagsView) {
    return vscode.commands.registerCommand('extension.gittags', function () {
        return __awaiter(this, void 0, void 0, function* () {
            // The code you place here will be executed every time your command is executed
            if (!vscode.workspace.workspaceFolders || !vscode.workspace.workspaceFolders.length) {
                return vscode.window.showWarningMessage(`Git Tags cannot be actived since no code repo opened`);
            }
            if (vscode.workspace.workspaceFolders.length !== 1) {
                return vscode.window.showWarningMessage(`Git Tags cannot be actived in multiple workspace mode`);
            }
            refreshTagsView();
            try {
                if (!panel) {
                    createWebPanel(context);
                }
                else if (!panel.visible) {
                    panel.reveal();
                }
                provider.panel = panel;
                provider.refreshView();
            }
            catch (err) {
                vscode.window.showErrorMessage(err);
            }
        });
    });
}
exports.listCMD = listCMD;
function createWebPanel(context) {
    panel = vscode.window.createWebviewPanel('gittags', 'git tags', vscode.ViewColumn.One, {
        enableScripts: true
    });
    panel.onDidDispose(() => {
        // When the panel is closed, cancel any future updates to the webview content
        panel = null;
    }, null, context.subscriptions);
    panel.webview.onDidReceiveMessage(message => {
        switch (message.command) {
            case 'deleteTag':
                vscode.commands.executeCommand('extension.deleteGitTag', message.text);
                return;
        }
    }, undefined, context.subscriptions);
}
//# sourceMappingURL=listTags.js.map