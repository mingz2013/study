/**
 * Created by zhaojm on 15/2/28.
 */
var fs = require('fs');

fs.readFile('file.txt', 'utf-8', function(err, data){
    if(err){
        console.error(err);
    }else{
        console.log(data);
    }
});

console.log('end');