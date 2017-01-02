/**
 * Created by zhaojm on 15/2/28.
 */
var express = require('express');

var app = express.createServer();

app.use(express.bodyParser());
app.all('/', function(req, res){
    res.end(req.body.title + req.body.text);
});

app.listen(3000);