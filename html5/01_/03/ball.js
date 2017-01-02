/**
 * Created by zhaojm on 15/4/29.
 */
function Ball(sx, sy, rad, vx, vy, stylestring){
    this.sy = sy;
    this.sx = sx;
    this.vx = vx;
    this.vy = vy;
    this.rad = rad;
    this.stylestring = stylestring;

    this.tid = null;

    this.draw = function(){
        ctx.fillStyle = this.stylestring;
        ctx.beginPath();
        ctx.arc(this.sx, this.sy, this.rad, 0, Math.PI * 2, true);
        ctx.fill();
    };

    this.move = function(){

        this.tid = setInterval(function(){
            this.sx += this.vx;
            this.sy += this.vy;

        }.bind(this), 100);

    };


    this.remove = function(){
        clearInterval(this.tid);
        everything.remove(this);
    };




}