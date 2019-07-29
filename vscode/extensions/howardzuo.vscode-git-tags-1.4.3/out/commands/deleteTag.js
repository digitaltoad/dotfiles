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
function deleteCMD(provider, refreshTagsView) {
    return vscode.commands.registerCommand('extension.deleteGitTag', function (tag) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const picked = yield vscode.window.showQuickPick(['Yes', 'No'], {
                    placeHolder: 'Would you like to delete this tag from remote repository as well?'
                });
                const rootFolder = vscode.workspace.workspaceFolders[0].uri.fsPath;
                if (picked === 'Yes') {
                    yield gitTagsResolver_1.syncDelete(tag, rootFolder);
                    yield gitTagsResolver_1.deleteTag(tag, rootFolder);
                }
                else {
                    yield gitTagsResolver_1.deleteTag(tag, rootFolder);
                }
                refreshTagsView();
                vscode.window.setStatusBarMessage(`Remote tag ${tag} deleted`, 3000);
            }
            catch (err) {
                refreshTagsView();
                vscode.window.showErrorMessage(`Delete remote Tag failed, \n ${err}`);
            }
        });
    });
}
exports.deleteCMD = deleteCMD;
//# sourceMappingURL=deleteTag.js.map