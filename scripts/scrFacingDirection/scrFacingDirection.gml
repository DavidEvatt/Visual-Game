// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrFacingDirection()
{	
	var dx = objTDPlayer.x - x
  	var dy = objTDPlayer.y - y
	
	var LH = sign(dx)
	var LV = sign(dy)
	
	var dir = "DOWN";
	
	if(LH >= 0 && LV <= 0)//Right and Up
	{
		if(abs(dx) >= abs(dy))
		{
			dir = "RIGHT";
		}
		else
		{
			dir = "UP";
		}
	}
	else if(LH >= 0 &&  LV >= 0)//Right and Down
	{
		if(abs(dx) >= abs(dy))
		{
			dir = "RIGHT";
		}
		else
		{
			dir = "DOWN";
		}
	}
	else if(LH <= 0 && LV <= 0 ) //Left and Up
	{
		if(abs(dx) >= abs(dy))
		{
			dir = "LEFT";
		}
		else
		{
			dir = "UP";
		}
	}
	else if(LH <= 0 && LV >= 0)//Left and Down
	{
		if(abs(dx) >= abs(dy))
		{
			dir = "LEFT";
		}
		else
		{	
			dir = "DOWN";
		}
	}
			
	show_debug_message(dir)
			
	return dir;
}