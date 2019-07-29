"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const child_process = require("child_process");
const util = require("util");
const wslpath_1 = require("./wslpath");
const execFileAsync = util.promisify(child_process.execFile);
function withWsl(withWsl) {
    return withWsl
        ? {
            execFile: withWslModifiedParameters(execFileAsync),
            execFileSync: withWslModifiedParameters(child_process.execFileSync),
            spawn: withWslModifiedParameters(child_process.spawn),
            modifyArgs: wslpath_1.modifyParametersForWSL,
        }
        : {
            execFile: execFileAsync,
            execFileSync: child_process.execFileSync,
            spawn: child_process.spawn,
            modifyArgs: (command, args) => ({ command, args }),
        };
}
exports.withWsl = withWsl;
function withWslModifiedParameters(
// tslint:disable-next-line: no-any
func) {
    // tslint:disable-next-line: no-any
    return (command, arg1, ...rest) => {
        if (arg1 instanceof Array) {
            ({ command, args: arg1 } = wslpath_1.modifyParametersForWSL(command, arg1));
        }
        return func(command, ...[arg1, ...rest]);
    };
}
//# sourceMappingURL=child_process.js.map