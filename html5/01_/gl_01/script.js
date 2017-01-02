/**
 * Created by zhaojm on 15/4/29.
 */
onload = function(){

    var c = document.getElementById('canvas');
    c.width = 500;
    c.height = 300;

    // 获取gl
    var gl = c.getContext('webgl') || c.getContext('experimental-webgl');

    // 清空
    gl.clearColor(0.0, 0.0, 0.0, 1.0);  // 黑色
    gl.clear(gl.COLOR_BUFFER_BIT);  // 清空所有对象
};