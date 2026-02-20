
if(mouse_x >= 38 and mouse_x <= 198)
{	
	if(mouse_y >= 30 and mouse_y <= 48)
	{
		if(currentState == STATUSSTATE.BARS)
		{
			currentState = STATUSSTATE.STATS;	
		}
		
		else if(currentState == STATUSSTATE.STATS)
		{	
			currentState = STATUSSTATE.BIRTHDAY;
		}
		
		else if(currentState == STATUSSTATE.BIRTHDAY)
		{
			currentState = STATUSSTATE.BARS;
			
		}
	}
}






