// Http server

var http = require('http');

http.createServer(function(req, res){
	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write('<h1>Node.js</h1>');
	res.write('<br/>');
	res.write('<h1>ha ha</h1>');
	res.end('<p>Hello world</p>');
}).listen(3000);

console.log("HTTP server is listening at port 3000.");

console.log("haha");