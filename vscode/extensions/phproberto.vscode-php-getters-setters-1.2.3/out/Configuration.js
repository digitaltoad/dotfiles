'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class Configuration {
    constructor() {
        this.config = vscode.workspace.getConfiguration('phpGettersSetters');
    }
    get(key, defaultValue) {
        return this.config.get(key, defaultValue);
    }
    getInt(key, defaultValue) {
        return parseInt(this.get(key, defaultValue));
    }
}
exports.default = Configuration;
//# sourceMappingURL=Configuration.js.map