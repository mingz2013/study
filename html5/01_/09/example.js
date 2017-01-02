/**
 * Created by zhaojm on 15/5/1.
 */
window.onload = function(){
    var context = document.getElementById('canvas').getContext('2d');
    var RADIUS = 75;
    var ball = new Sprite('ball', {
        paint : function(sprite, context){
            context.beginPath();
            context.arc(
                sprite.left + sprite.width / 2
                , sprite.top + sprite.height / 2
                , RADIUS
                , 0
                , Math.PI * 2
                , false
            );
            context.clip();

            context.shadowColor = 'rgb(0, 0, 0)';
            context.shadowOffsetX = -4;
            context.shadowOffsetY = -4;
            context.shadowBlur = 8;

            context.lineWidth = 2;
            context.strokeStyle = 'rgb(100, 100, 195)';
            context.fillStyle = 'rgba(30, 144, 255, 0.15)';
            context.fill();
            context.stroke();
        }
    });

    function drawGrid(color, stepx, stepy){
        // Draws a grid. see section 2.8.2
        // for a full listing
    }

    drawGrid('lightgray', 10, 10);
    ball.left = 320;
    ball.top = 160;
    ball.paint(context);

};

