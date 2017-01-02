/**
 * Created by zhaojm on 15/4/30.
 */



window.onload = function(){
    var canvas = document.getElementById('canvas');
    canvas.width = 500;
    canvas.height = 500;
    var ctx = canvas.getContext('2d');
    var paused = true;
    var discs = [
        {
            x:150,
            y:250,
            lastX:150,
            lastY:250,
            velocityX:-3.2,
            velocityY:3.5,
            radius:25,
            innerColor:'rgba(255, 255, 0, 1)',
            middleColor:'rgba(255, 255, 0, 0.7)',
            outerColor:'rgba(255, 255, 0, 0.5)',
            strokeStyle:'gray',
        },
        {
            x:50,
            y:150,
            lastX:50,
            lastY:150,
            velocityX:2.2,
            velocityY:2.5,
            radius:25,
            innerColor:'rgba(100, 145, 230, 1.0)',
            middleColor:'rgba(100, 145, 230, 0.7)',
            outerColor:'rgba(100, 145, 230, 0.5)',
            strokeStyle:'blue',
        },
        {
            x:150,
            y:75,
            lastX:150,
            lastY:75,
            velocityX:1.2,
            velocityY:1.5,
            radius:25,
            innerColor:'rgba(255, 0, 0, 1.0)',
            middleColor:'rgba(255, 0, 0, 0.7)',
            outerColor:'rgba(255, 0, 0, 0.5)',
            strokeStyle:'orange',
        },
    ];

    var numDiscs = discs.length;
//var animationButton = document.getElementById('animateButton');

// functions.................
    function drawBackground(){

    }

    function update(){
        var disc = null;

        for(var i = 0; i < numDiscs; ++i){
            disc = discs[i];

            if(disc.x + disc.velocityX + disc.radius > ctx.canvas.width ||
                disc.x + disc.velocityX - disc.radius < 0){
                disc.velocityX =- disc.velocityX;
            }
            if(disc.y + disc.velocityY + disc.radius > ctx.canvas.height ||
                disc.y + disc.velocityY - disc.radius < 0){
                disc.velocityY =- disc.velocityY;
            }

            disc.x += disc.velocityX;
            disc.y += disc.velocityY;

        }

    }

    function draw(){
        var disc ;//= discs[i];

        for(var i = 0; i < numDiscs; ++i){
            disc = discs[i];
            var gradient = ctx.createRadialGradient(disc.x, disc.y, 0, disc.x, disc.y, disc.radius);
            gradient.addColorStop(0.3, disc.innerColor);
            gradient.addColorStop(0.5, disc.middleColor);
            gradient.addColorStop(1.0, disc.outerColor);

            ctx.save();
            ctx.beginPath();
            ctx.arc(disc.x, disc.y, disc.radius, 0, Math.PI * 2, false);
            ctx.fillStyle = gradient;
            ctx.strokeStyle = disc.strokeStyle;
            ctx.fill();
            ctx.stroke();
            ctx.restore();
        }
    }

    var lastTime = 0;
    var now;
    function calculateFps(){
        now = (+new Date());
         var   fps = 1000 / (now - lastTime);

        lastTime = now;

        return fps;
    }

    var lastFpsUpdateTime = 0;
    var lastFpsUpdate = 0;
    function animate(time){
        var fps = 0;
        if(time == undefined){
            time =+ new Date();
        }

        if(!paused){
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            drawBackground();
            update();
            draw();

            fps = calculateFps();
            if(now - lastFpsUpdateTime > 1000){
                lastFpsUpdateTime = now;
                lastFpsUpdate = fps;
            }

            ctx.fillStyle = 'cornflowerblue';
            ctx.fillText(lastFpsUpdate.toFixed() + 'fps', 50, 48);

            window.requestNextAnimationFrame(animate);
        }
    }


//animationButton.onclick = function(e){
//    paused = paused ? false : true;
//    if(paused){
//        animationButton.value = 'Animate';
//    }else{
//        window.requestNextAnimationFrame(animate);
//        animationButton.value = 'Pause';
//    }
//}


    ctx.font = '48px Helvetica';

    paused = false;

    window.requestNextAnimationFrame(animate);

};

