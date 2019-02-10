'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
const reduxDevtoolsProvider_1 = require("./providers/reduxDevtoolsProvider");
const configSettings_1 = require("./common/configSettings");
function activate(context) {
    const settings = new configSettings_1.default();
    const socketOptions = {
        hostname: settings.get('hostname'),
        port: settings.get('socketOptions'),
    };
    context.subscriptions.push(vscode.workspace.registerTextDocumentContentProvider('redux-devtools', new reduxDevtoolsProvider_1.ReduxDevtoolsProvider(socketOptions)));
    const devtoolsUri = vscode.Uri.parse('redux-devtools://authority/Redux\0Devtools');
    context.subscriptions.push(vscode.commands.registerCommand('extension.openReduxDevtools', () => {
        return vscode.commands.executeCommand('vscode.previewHtml', devtoolsUri, vscode.ViewColumn.Two).then((success) => {
            console.log('previewing');
        }, (reason) => {
            vscode.window.showErrorMessage(reason);
        });
    }));
    context.subscriptions.push(vscode.commands.registerCommand('extension.startRemotedevServer', () => {
        return new Promise((resolve, reject) => {
            resolve();
        }).then(() => console.log('remotedev start successfully'));
    }));
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map