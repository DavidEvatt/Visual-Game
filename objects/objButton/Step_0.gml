if(mouse_x >= x -14 and mouse_x <= x + 14)
{
	if(mouse_y >= y+20 and mouse_y <= y+46)
	{
		image_index = 2;
		bottom = true;
	}
	
	else if(mouse_y >= y-46 and mouse_y <= y-20)
	{
		image_index = 1;
		top = true;
	}
	
	else 
	{
		image_index = 0;
		bottom = false;
		top = false;
	}
}

else 
{
	image_index = 0;
	bottom = false;
	top = false;
}





