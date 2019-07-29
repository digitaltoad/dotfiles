"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const child_process = require("child_process");
function startRemotedev() {
    let port = 1024;
    let remotedevPath = require.resolve('../scripts/remotedev.js');
    console.log(remotedevPath);
    let ps = child_process.execFile(remotedevPath, [`--port=${port}`]);
    // child_process.execFileSync(remotedevPath);
    let log = function (...args) {
        console.log(args);
    };
    ps.on('stderr', log);
    ps.on('stdout', log);
    return ps;
}
exports.default = startRemotedev;
//# sourceMappingURL=startRemotedev.js.map