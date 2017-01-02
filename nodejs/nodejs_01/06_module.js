// 一个模块
var name;

// exports 是模块的公开接口
exports.setName = function(thyName) {
	name = thyName;
};

exports.sayHello = function() {
	console.log('hello ' + name);
};