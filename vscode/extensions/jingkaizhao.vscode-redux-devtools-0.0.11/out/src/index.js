'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
//<script src="https://unpkg.com/remotedev-app@0.10.7/dist/remotedev-app.min.js"></script>
function activate(context) {
    let initUri = vscode.Uri.parse('redux-devtools://authority/Redux\0Devtools');
    const provider = {
        provideTextDocumentContent: function (uri) {
            return `<!DOCTYPE html>
                    <html>
                        <head>
                            <title>Remote Devtools</title>
                            <style>
                                html, body, #root {
                                    width: 100%;
                                    height: 100%;
                                }
                            </style>
                        </head>
                        <body>
                            <div id="root"></div>
                       </body>
                       <script src="https://unpkg.com/react@15/dist/react.min.js"></script>
                       <script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
                       <script src="https://unpkg.com/remotedev-app@0.11.0-0/dist/remotedev-app.min.js"></script>
                       <script>
                         let root = document.getElementById('root');
                         ReactDOM.render(
                             React.createElement(
                                 RemoteDevApp, 
                                 {
                                    socketOptions: {
                                        hostname: 'localhost',
                                        port: 1024,
                                        autoReconnect: true
                                    }
                                 }, 
                                 'Remote Devtools'
                             ),
                             root
                         );
                       </script>
                    </html>`;
        }
    };
    let registration = vscode.workspace.registerTextDocumentContentProvider('redux-devtools', provider);
    let disposable = vscode.commands.registerCommand('extension.reduxDevtools', () => {
        return vscode.commands.executeCommand('vscode.previewHtml', initUri, vscode.ViewColumn.Two).then((success) => {
            console.log('previewing');
        }, (reason) => {
            vscode.window.showErrorMessage(reason);
        });
    });
    context.subscriptions.push(disposable, registration);
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=index.js.map