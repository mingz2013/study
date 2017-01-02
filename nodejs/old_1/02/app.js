/**
 * Created by zhaojm on 15/2/28.
 */
var http = require('http');

http.createServer(function(req, res){
    res.writeHead(200, {'ContentType':'text/html'});
    res.write('<h1>Node.js</h1>');
    res.end('<p>Hello world</p>');
}).listen(3000);
console.log('HTTP server is listening at port 3000');

