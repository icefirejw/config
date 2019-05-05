# JSON-RPC Path
JSON-RPC Path 默认为: http://localhost:6800/jsonrpc
# 如果提示 Aria2 RPC 服务器错误 按照以下方法修改
- host: 指运行 Aria2 所在机器的 IP 或者名字
- port: 使用 --rpc-listen-port 选项设置的端口, 未设置则是 6800
- 普通情况设置为: http://host:port/jsonrpc
   使用 --rpc-secret=xxxxxx 选项设置为: http://token:xxxxxx@host:port/jsonrpc

以上 JSON-RPC Path 中的 http 可以用 ws 替代, 代表使用 WebSocket 协议
当使用 https://aria2c.com 访问时, 需要使用 https 或 wss 协议
