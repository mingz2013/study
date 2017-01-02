// 同步读取文件

var fs = require('fs');

var data = fs.readFileSync('04_file.txt', 'utf-8');	// IO阻塞

console.log(data);

console.log('end.');