"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const remotedev = require('remotedev-server');
function startRemotedev() {
    remotedev({
        hostname: '127.0.0.1',
        port: 1024,
    });
}
exports.default = startRemotedev;
//# sourceMappingURL=remotedev.js.map