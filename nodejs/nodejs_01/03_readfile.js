// 异步方式读取文件
// 不阻塞，将异步IO命令发给操作系统，然后立即执行后面命令，执行完以后进入时间循环监听事件。
// 当fs接收到IO请求完成的事件时，事件循环会主动调用回调函数以完成后续工作。
// 因此我们会先看到end.再看到file.txt文件的内容
var fs = require('fs');

fs.readFile('03_file.txt', 'utf-8', function(err, data){	
	if(err){
		console.error(err);
	}else{
		console.log(data);
	}
});

console.log('end.');