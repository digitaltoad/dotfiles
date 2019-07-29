'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const reduxDevtools_1 = require("./webview/reduxDevtools");
function activate(context) {
    let devtoolsPanel = null;
    context.subscriptions.push(vscode.commands.registerCommand('extension.openReduxDevtools', () => {
        if (!devtoolsPanel) {
            devtoolsPanel = reduxDevtools_1.createReduxDevtoolsPanel(context);
            devtoolsPanel.onDidDispose(() => { devtoolsPanel = null; }, null, context.subscriptions);
        }
        else {
            devtoolsPanel.reveal();
        }
    }));
}
exports.activate = activate;
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map