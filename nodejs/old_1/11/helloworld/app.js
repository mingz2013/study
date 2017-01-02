/**
 * Created by zhaojm on 15/2/28.
 */
var express = require('express');
var app = express();

app.get('/hello.txt', function(req, res){
    res.send('hello world');
});

var server = app.listen(3000, function(){
    console.log('listening on port %d', server.address().port);
});