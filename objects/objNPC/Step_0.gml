
	switch(currentState)
	{
		case NPCSTATE.MOVE: npcStateMoveTo(); show_debug_message("State is MOVE"); break;
		case NPCSTATE.DISTRACTED: npcStateDistracted(); show_debug_message("State is DISTRACTED") break;
		case NPCSTATE.IDLE: show_debug_message("State is IDLE") break;

	}


if(!atPlace && path_position == 1)
{
	atPlace = true;
	needsPlace = true;
}

if(ds_list_find_value(schedule, eventPosition)[? "classification"] == "WORK")
{
	if(point_distance(x, y, ds_list_find_value(schedule, eventPosition)[? "xPos"], ds_list_find_value(schedule, eventPosition)[? "yPos"]) <= 30)
	{
		if(!working){working = true};	
	}
}


if(working && ds_list_find_value(schedule, eventPosition)[? "classification"] != "WORK")
{
	if(objSun.currentTime >= ds_list_find_value(schedule, eventPosition)[? "startTime"])
	{
		if(working){working = false;}
	}
}

if(currentState != NPCSTATE.IDLE)
{
	if(holdNewSpotTimer > 0){holdNewSpotTimer--;}
	if(dps > 0){dps--;}
	if(ADHD > 0){ADHD--;}
	else if(ADHD == 0)
	{
		dps = 600;
		movingToSpot = false
		currentState = NPCSTATE.MOVE
		needsPlace = true;
		ADHD = -1;
		reset = true
	}

	if(talkLength > 0){talkLength--;}
	else if(talkLength <= 0 && path_speed == 0){path_speed = pathSpd;  currentState = NPCSTATE.MOVE}
}

if(movingToSpot && path_position == 1)
{
	show_debug_message("Firing the movingSpot and pathPos Loop");
	holdNewSpotTimer = newSpotTimer;
	movingToSpot = false
}

if(objSun.currentTime == ds_list_find_value(schedule, eventPosition)[? "startTime"] + (10 * 60))
{
		x = ds_list_find_value(schedule, eventPosition)[? "xPos"];
		y = ds_list_find_value(schedule, eventPosition)[? "yPos"]
	
		needsPlace = true;
		eventPosition++;
}

if(path_position == 1 && reset)
{
	reset = false;
	needsPlace = true;
}



if(path_position == 1 && !needsPlace && currentState == NPCSTATE.MOVE && !reset)
{
	var dist = point_distance(x, y, ds_list_find_value(schedule, eventPosition)[? "xPos"], ds_list_find_value(schedule, eventPosition)[? "yPos"]);
	if(dist <= pathSpd)
	{
		needsPlace = true;
		eventPosition++;	
	}
}

if(eventPosition == 0)
{
	needsPlace = true;
	eventPosition++;	
}

if(path_position == 1 && distracted && ADHD <= 0)
{
	show_debug_message("Inside the distracted and ADHD <= 0 Loop");
	distracted = false;	
	needsPlace = true;
}

if(objSun.currentTime == 0)
{
	eventPosition = 0;	
}

show_debug_message("Event position " + string(eventPosition) + " | needsPlace " + string(needsPlace) + " | currentTime " + string(objSun.currentTime))

if(objSun.currentTime < ds_list_find_value(schedule, 1)[? "startTime"] - 1000)
{
	show_debug_message("Less than first event")
	if(currentState != NPCSTATE.IDLE)
	{
		currentState = NPCSTATE.IDLE
	}
}

else if(objSun.currentTime > ds_list_find_value(schedule, ds_list_size(schedule) -1)[? "startTime"])
{
	show_debug_message("greater than last event")
	if(currentState != NPCSTATE.IDLE)
	{
		currentState = NPCSTATE.IDLE
	}
}

else if(objSun.currentTime == ds_list_find_value(schedule, 1)[? "startTime"] - 999)
{
	show_debug_message("equal to first event")
	if(currentState != NPCSTATE.MOVE)
	{
		currentState = NPCSTATE.MOVE
	}
}


