// 事件 由EventEmitter提供

var EventEmitter = require('events').EventEmitter;

var event = new EventEmitter();

event.on('some_event', function(){	// 注册事件监听器
	console.log('some_event occured');
});

setTimeout(function() {
	event.emit('some_event');
}, 1000);	// 1000毫秒后向event对象发送事件some_event