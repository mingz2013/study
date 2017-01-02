/**
 * Created by zhaojm on 15/2/28.
 */
var fs = require('fs');
var data = fs.readFileSync('file.txt', 'utf-8');    // 同步读取文件
console.log(data);
console.log('end');