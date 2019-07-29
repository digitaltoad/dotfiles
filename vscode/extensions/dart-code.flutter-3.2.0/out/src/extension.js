"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vs = require("vscode");
const sdk_1 = require("./commands/sdk");
const constants_1 = require("./constants");
function activate(context) {
    return __awaiter(this, void 0, void 0, function* () {
        // Ensure we have a Dart extension.
        const dartExt = vs.extensions.getExtension(constants_1.dartCodeExtensionIdentifier);
        if (!dartExt) {
            // This should not happen since the Flutter extension has a dependency on the Dart one
            // but just in case, we'd like to give a useful error message.
            throw new Error("The Dart extension is not installed, Flutter extension is unable to activate.");
        }
        yield dartExt.activate();
        // Register SDK commands.
        const sdkCommands = new sdk_1.SdkCommands(context, dartExt.exports);
    });
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map