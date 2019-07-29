'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class Redirector {
    constructor(editor) {
        this.editor = editor ? editor : vscode.window.activeTextEditor;
    }
    goToLine(lineNumber) {
        const line = this.editor.document.lineAt(lineNumber);
        this.editor.revealRange(line.range);
        const newPosition = new vscode.Position(line.lineNumber, line.range.end.character);
        this.editor.selection = new vscode.Selection(newPosition, newPosition);
    }
}
exports.default = Redirector;
//# sourceMappingURL=Redirector.js.map