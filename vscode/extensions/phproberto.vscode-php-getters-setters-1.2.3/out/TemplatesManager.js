'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const Configuration_1 = require("./Configuration");
const fs = require("fs");
const path = require("path");
const os = require("os");
class TemplatesManager {
    constructor() {
        this.config = new Configuration_1.default;
        ;
        this.initTemplatesDir();
    }
    exists(fileName) {
        return fs.existsSync(path.join(this.templatesDir(), fileName));
    }
    path(fileName) {
        return path.join(this.templatesDir(), fileName);
    }
    templatesDir() {
        let settingsDir = this.config.get('templatesDir', null);
        if (settingsDir && fs.existsSync(settingsDir)) {
            return settingsDir;
        }
        return this.defaultTemplatesDir();
    }
    defaultTemplatesDir() {
        let userDataDir = null;
        switch (process.platform) {
            case 'linux':
                userDataDir = path.join(os.homedir(), '.config');
                break;
            case 'darwin':
                userDataDir = path.join(os.homedir(), 'Library', 'Application Support');
                break;
            case 'win32':
                userDataDir = process.env.APPDATA;
                break;
            default:
                throw Error("Unrecognizable operative system");
        }
        return path.join(userDataDir, 'Code', 'User', 'phpGettersSetters');
    }
    initTemplatesDir() {
        let templatesDir = this.templatesDir();
        fs.mkdir(templatesDir, '0755', function (err) {
            if (err && err.code != 'EEXIST') {
                throw Error("Failed to created templates directory " + templatesDir);
            }
        });
    }
}
exports.default = TemplatesManager;
//# sourceMappingURL=TemplatesManager.js.map