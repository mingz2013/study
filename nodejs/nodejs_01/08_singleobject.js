// 一个对象封装到模块中

function Hello() {
	var name;
	
	this.setName = function(thyName) {
		name = thyName;
	};
	
	this.sayHello = function() {
		console.log('Hello ' + name);
	};
};

// exports.Hello = Hello;	// require('./08_singleobject').Hello 获取对象

// 简化一下
module.exports = Hello; // var Hello = require('./08_singleobject');

/**
	事实上，exports 本身仅仅是一个普通的空对象，即 {}，它专门用来声明接口，本
质上是通过它为模块闭包①的内部建立了一个有限的访问接口。因为它没有任何特殊的地方，
所以可以用其他东西来代替，譬如我们上面例子中的 Hello 对象。
**/