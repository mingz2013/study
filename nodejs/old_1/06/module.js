/**
 * Created by zhaojm on 15/2/28.
 */
var name;
exports.setName = function(thyName){
  name = thyName;
};
exports.sayHello = function() {
    console.log('hello ' + name);
};