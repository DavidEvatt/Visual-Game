
if(currentState == POPSTATE.VISIBLE)
{
	
	if(curTimer > 0)
	{
		alphaVal = (curTimer/maxVisibleTimer) * 2;
		curTimer--;	
	}

	else
	{
		currentState = POPSTATE.HIDDEN
	}
	
	draw_self();
}









