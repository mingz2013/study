/**
 * Created by zhaojm on 15/4/29.
 */
function MyRectAngle(sx, sy, swidth, sheight, stylestring){
    this.sx = sx;
    this.sy = sy;
    this.swidth = swidth;
    this.sheight = sheight;
    this.fillStyle = stylestring;
    this.draw = function(){
        ctx.fillStyle = this.fillStyle;
        ctx.fillRect(this.sx, this.xy, this.swidth, this.sheight);
    };




}