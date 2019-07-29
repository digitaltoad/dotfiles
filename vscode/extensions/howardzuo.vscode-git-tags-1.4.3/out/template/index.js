"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = __importStar(require("vscode"));
const path = __importStar(require("path"));
const template_1 = __importDefault(require("lodash/template"));
const compiled = template_1.default(`
        <html>
            <link rel="stylesheet" href="${assetPath('css', 'gittags.css')}" >
            <body>
                <div id="container" class="ag-theme-blue"></div>

                <script>
                window.rows = <%= JSON.stringify(obj.tags) %>
                </script>
                <script src="${assetPath('js', 'aggrid.js')}"></script>
                <script src="${assetPath('js', 'app.js')}"></script>
            </body>
        </html>
    `, { variable: 'obj' });
function html(tags) {
    return compiled({
        tags
    });
}
exports.html = html;
function assetPath(...args) {
    return vscode.Uri.file(path.join(__dirname, '..', '..', 'assets', ...args)).with({
        scheme: 'vscode-resource'
    });
}
function nodeModulesPath(...args) {
    return vscode.Uri.file(path.join(__dirname, '..', '..', 'node_modules', ...args)).toString();
}
//# sourceMappingURL=index.js.map