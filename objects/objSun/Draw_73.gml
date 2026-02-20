part_system_drawit(particleManager._psHit)

if(!surface_exists(lightSurf))
{
	lightSurf = surface_create(camWidth, camHeight)
}

surface_set_target(lightSurf);


draw_clear_alpha(midnightBlue, alphaVal);
camera_apply(objCamera.cam)

gpu_set_blendmode(bm_subtract);

var xFlicker = 0;
var yFlicker = 0;

with(objLight)
{
	switch(self.lightDegree)
	{
		case 1:
		{
			xFlicker = 3 + 0.125 * sin(current_time / 250);
			yFlicker = 3 + 0.125 * sin(current_time / 250);
			draw_sprite_ext(sprLIght1, 0, self.x, self.y, xFlicker, yFlicker, 0, c_white, 1)	
			break;	
		}
		
		case 2:
		{
			xFlicker = 4 + 0.125 * sin(current_time / 500);
			yFlicker = 3 + 0.125 * sin(current_time / 500);
			draw_sprite_ext(sprLight2, 0, self.x, self.y + 16, xFlicker, yFlicker, 0, c_white, 1)
		}
	}
	
}

gpu_set_blendmode(bm_normal);
surface_reset_target();








