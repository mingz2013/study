// require 不会重复加载模块

var hello1 = require('./06_module');
hello1.setName('MingZz');

var hello2 = require('./06_module');
hello2.setName('MingZz 2');

hello1.sayHello();