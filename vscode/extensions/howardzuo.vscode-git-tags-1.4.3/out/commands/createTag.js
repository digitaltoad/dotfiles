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
const gitTagsResolver_1 = require("../services/gitTagsResolver");
function createCMD(provider, refreshTagsView) {
    return vscode.commands.registerCommand('extension.gitcreatetag', function () {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const tag = yield vscode.window.showInputBox({
                    placeHolder: 'Type a tag...'
                });
                if (!tag || !tag.trim()) {
                    return;
                }
                const message = yield vscode.window.showInputBox({
                    placeHolder: 'Type a message...'
                });
                if (message) {
                    yield gitTagsResolver_1.createWithMessage(tag, message, vscode.workspace.rootPath);
                }
                else {
                    yield gitTagsResolver_1.create(tag, vscode.workspace.rootPath);
                }
                refreshTagsView();
                const picked = yield vscode.window.showQuickPick(['Yes', 'No'], {
                    placeHolder: 'Would you like to sync this tag to remote repository?'
                });
                if (picked !== 'Yes') {
                    return;
                }
                yield gitTagsResolver_1.syncCreate(vscode.workspace.rootPath);
                vscode.window.setStatusBarMessage('Tag synchronised', 3000);
            }
            catch (err) {
                vscode.window.showErrorMessage(err);
            }
        });
    });
}
exports.createCMD = createCMD;
//# sourceMappingURL=createTag.js.map