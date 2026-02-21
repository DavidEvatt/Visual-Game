if(needsDefinition)
{
	image_index = FrameDef
	needsDefinition = false;	
}

if(objTDPlayer.y >= (y + 32) || objNPC.y >= (y + 32))
{
	depth = 2;
}

else {depth = 0;}



curNPCEvent = ds_list_find_value(npcFollow.schedule, npcFollow.eventPosition);
//show_debug_message(curNPCEvent[? "classification"])
if(curNPCEvent[? "classification"] == "ENDWORK")
{
	open = true;
}

else
{
	open = false;	
}




