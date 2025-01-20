/// @description Initialize
//Randomize
randomize();

//Variables
windowWidth = room_width;
windowHeight = room_height;
windowDepth = 400;
blackholepos = [windowWidth/2, windowHeight/2-10, windowDepth];
blackholeradius = 80;
discOuterRadius = 350;
discInnerRadius = 100;
outerDiscLength = (discOuterRadius - discInnerRadius)/2

limitOfRaycasts = windowDepth*2;
discHeight = 10;

raycastspd = 10;
grav = 10;

outerDiscColor = c_ltgray;
innerDiscColor = c_white;
blackholeColor = c_black;
bgColor = c_black;
starColor = c_white;
staramount = 100;
stars = [];

raycasts = [];
raycastsToDraw = [];
amountRaycastsHeight = 256;
amountRaycastsWidth = 256;


blockwidth = windowWidth/amountRaycastsWidth;
blockheight = windowHeight/amountRaycastsHeight;

orthogonal = false;

//Create raycasts
for(var yy = 0; yy < amountRaycastsHeight; yy++){
	for(var xx = 0; xx < amountRaycastsWidth; xx++){
		//Orthogonal
		if(orthogonal){
			array_push(raycasts, {
				xpos: xx * blockwidth + blockwidth/2,
				ypos: yy * blockheight + blockheight/2,
				zpos: 0,
				dir: [0, 0, 1],
				done: false
			});
		}
		else{
			//Perspective
			var dirx = ((xx * blockwidth) - windowWidth / 2) / amountRaycastsWidth;
			var diry = ((yy * blockheight) - windowHeight / 2) / amountRaycastsHeight;
			array_push(raycasts, {
				xpos: windowWidth/2,
				ypos: windowHeight/2,
				zpos: 0,
				dir: [dirx, diry, 1],
				done: false
			});
		}
	}
}

//Create stars
repeat(staramount){
	array_push(stars, {
		xpos: irandom(windowWidth),
		ypos: irandom(windowHeight)
	});
}

//Surface
drawSurface = -1;
shaderSurface = -1;
shaderMultiply = 10;


