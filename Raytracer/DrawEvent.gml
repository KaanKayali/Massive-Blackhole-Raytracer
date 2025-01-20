/// @description Drawing
//Surface
if (!surface_exists(drawSurface)) drawSurface = surface_create(windowWidth, windowHeight);
surface_set_target(drawSurface);
draw_clear(bgColor);

//Draw stars
for(var i = 0; i < array_length(stars); i++){
	draw_set_color(starColor);
	draw_point(stars[i].xpos, stars[i].ypos);
}

//Draw raycast
for(var i = 0; i < array_length(raycastsToDraw); i++){
	draw_set_color(raycastsToDraw[i].pixelcolor);
	draw_rectangle(
		raycastsToDraw[i].xposOnScr * blockwidth,
		raycastsToDraw[i].yposOnScr * blockheight,
		raycastsToDraw[i].xposOnScr * blockwidth + blockwidth,
		raycastsToDraw[i].yposOnScr * blockheight + blockheight,
		false
	);
}

//Draw surface
surface_reset_target();
draw_surface(drawSurface, 0, 0);

//Draw shader
if (!surface_exists(shaderSurface)) shaderSurface = surface_create(windowWidth/shaderMultiply, windowHeight/shaderMultiply);
var interpol = gpu_get_texfilter();
gpu_set_texfilter(true);
surface_set_target(shaderSurface);
draw_surface_stretched(application_surface, 0, 0, windowWidth/shaderMultiply, windowHeight/shaderMultiply);
surface_reset_target();
gpu_set_blendmode(bm_add);
draw_surface_stretched(shaderSurface, 0, 0, windowWidth, windowHeight);
gpu_set_texfilter(interpol);
gpu_set_blendmode(bm_normal);




