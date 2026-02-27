if(objTDPlayer.y >= (y + 32))
{
	depth = 2;
}

else {depth = 0;}


if(npcFollow != noone)
{
	if(npcFollow.y >= (y + 32))
	{
		depth = 2;
	}

	else {depth = 0;}
	
	curNPCEvent = ds_list_find_value(npcFollow.schedule, npcFollow.eventPosition);
	//show_debug_message(curNPCEvent[? "classification"])
	if(npcFollow.working)
	{
		open = true;
	}

	else
	{
		open = false;	
	}
}







