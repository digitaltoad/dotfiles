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
const gitTagsResolver_1 = require("./services/gitTagsResolver");
const template_1 = require("./template");
class GitTagsViewProvider {
    constructor() {
        gitTagsResolver_1.refreshFromRemote(vscode.workspace.workspaceFolders[0].uri.fsPath);
    }
    // public provideTextDocumentContent(uri: vscode.Uri): string {
    //     if (!this._tags) {
    //         return '';
    //     }
    //     return html(this._tags);
    // }
    set panel(panel) {
        this._panel = panel;
    }
    // get onDidChange(): vscode.Event<vscode.Uri> {
    //     return this._onDidChange.event;
    // }
    // public async updateTags() {
    //     const cwd = vscode.workspace.rootPath;
    //     this._tags = await tags(cwd);
    //     this._onDidChange.fire(GITTAGSURI);
    // }
    getInitHtml() {
        return __awaiter(this, void 0, void 0, function* () {
            const cwd = vscode.workspace.rootPath;
            yield gitTagsResolver_1.refreshFromRemote(vscode.workspace.workspaceFolders[0].uri.fsPath);
            const tagList = yield gitTagsResolver_1.tags(cwd);
            return template_1.html(tagList);
        });
    }
    refreshView() {
        return __awaiter(this, void 0, void 0, function* () {
            if (!this._panel) {
                return;
            }
            const html = yield this.getInitHtml();
            this._panel.webview.html = html;
        });
    }
}
exports.GitTagsViewProvider = GitTagsViewProvider;
//# sourceMappingURL=gitTagsViewProvider.js.map