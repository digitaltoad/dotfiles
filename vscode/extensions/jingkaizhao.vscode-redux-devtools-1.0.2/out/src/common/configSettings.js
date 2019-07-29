"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class ReduxDevtoolsSettings {
    constructor() {
        this.config = {};
        this.config = vscode.workspace.getConfiguration('reduxdev');
    }
    get(key) {
        return this.config[key];
    }
}
exports.default = ReduxDevtoolsSettings;
//# sourceMappingURL=configSettings.js.map