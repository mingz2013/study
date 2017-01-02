/**
 * Created by zhaojm on 15/2/28.
 */
function Hello() {
    var name;
    this.setName = function(thyName){
        name = thyName;
    };
    this.sayHello = function() {
        console.log('Hello ' + name);
    };
}

exports.Hello = Hello;