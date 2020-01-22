var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World From NodeJs - Commit 4\n');
}).listen(3000, "127.0.0.1");
