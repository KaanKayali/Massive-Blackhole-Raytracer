/// @description Steps
//Drawable raycasts pos
var heightpos = -1;
var widthpos = -1;

//Input blackhole
for(var i = 0; i < array_length(raycasts); i++){
	//Calculate position on screen
	if(i % amountRaycastsWidth == 0){
		widthpos = 0;
		heightpos++;
	}
	else{
		widthpos++;	
	}
		
	//Still calculating path?
	if(!raycasts[i].done){
		dx = blackholepos[0] - raycasts[i].xpos;
		dy = blackholepos[1] - raycasts[i].ypos;
		dz = blackholepos[2] - raycasts[i].zpos;
		var disToBlackhole = sqrt(power(dx, 2) + power(dy, 2) + power(dz, 2));
		var force = grav / disToBlackhole;
		var fx = force * dx / disToBlackhole;
		var fy = force * dy / disToBlackhole;
		var fz = force * dz / disToBlackhole;
		
		insideBlackhole = false;
		insideDisc = false;
			
		//Collision with blackhole
		if(disToBlackhole <= blackholeradius){
			insideBlackhole = true;
		}
	
		//Collision with disc
		if(disToBlackhole <= discOuterRadius && disToBlackhole >= discInnerRadius && raycasts[i].ypos > blackholepos[1] - discHeight/2 && raycasts[i].ypos < blackholepos[1] + discHeight/2){
			insideDisc = true;
		}
		
		//Draw pixel which landed in blackhole, on disc or outside the limit
		if(insideDisc || insideBlackhole || raycasts[i].zpos >= limitOfRaycasts){
			//Set color & position on Screen
			var drawcolor = -1;
			if(insideDisc) drawcolor = (disToBlackhole >= discOuterRadius - outerDiscLength) ? outerDiscColor : innerDiscColor;
			if(insideBlackhole) drawcolor = blackholeColor;
			
			//Add to drawable raycasts
			if(raycasts[i].zpos < limitOfRaycasts){
				array_push(raycastsToDraw, {
					xposOnScr: widthpos,
					yposOnScr: heightpos,
					pixelcolor: drawcolor
				});
			}
			
			//Raycast is done calculating
			raycasts[i].done = true;
		}
		
		//Move if not in blackhole or insidedisc
		else{
			raycasts[i].dir[0] += fx;
			raycasts[i].dir[1] += fy;
			raycasts[i].dir[2] += fz;
		
		    // Move the raycast in the direction of the normalized vector
			var magnitude = sqrt(power(raycasts[i].dir[0], 2) + power(raycasts[i].dir[1], 2) + power(raycasts[i].dir[2], 2));
			var normalizedDir = [
			    raycasts[i].dir[0] / magnitude,
			    raycasts[i].dir[1] / magnitude,
			    raycasts[i].dir[2] / magnitude
			];
		

			// Update the position using the normalized direction vector
			raycasts[i].xpos += raycastspd * normalizedDir[0];
			raycasts[i].ypos += raycastspd * normalizedDir[1];
			raycasts[i].zpos += raycastspd * normalizedDir[2];
		}
		
	}
	
}






