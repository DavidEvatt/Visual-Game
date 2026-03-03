/*
	Create a value statment to see what needs to be seen

curStartTime = ds_list_find_value(schedule, eventPosition)[? "startTime"] ;
show_debug_message(whoAmI + "(ST: " + string(curStartTime) + ", MTS: " + string(movingToSpot) 
				   + ", R: " + string(reset) + ", AP: " + string(atPlace) + ", D: " + string(distracted) +
				   ", State: " + stateVarb + ", EP: " + string(eventPosition) + ", X: " + string(ds_list_find_value(schedule, eventPosition)[? "xPos"])
				   + " | " + string(x) + ", Y: " + string( ds_list_find_value(schedule, eventPosition)[? "yPos"]) + " | " + string(y) + ")")
*/
if(!working)
{
	switch(currentState)
	{
		case NPCSTATE.MOVE: npcStateMoveTo(); stateVarb = "MOVE"; break;
		case NPCSTATE.DISTRACTED: npcStateDistracted(); stateVarb = "DISTRACTED" break;
		case NPCSTATE.IDLE: stateVarb = "IDLE"; break;
		case NPCSTATE.TALK: stateVarb = "NPCTALK"; break;
		case NPCSTATE.TALKTOPLAYER: stateVarb = "PLAYERTALK"; break;
	}
}

#region Decrements
	if(currentState != NPCSTATE.TALKTOPLAYER)
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
		else if(talkLength <= 0 && path_speed == 0)
		{
			path_speed = pathSpd; 
			dps = 600;
			currentState = NPCSTATE.MOVE
		}
		
		if(needsText == false){needsText = true};
	}
	
	else
	{
		if (charCount < string_length(dialougeOption)) 
		{
		    charCount += typeSpd;
		}	
	}
#endregion

#region Event and Sun Things
	//reset the day schedule
	if(objSun.currentTime == 0)
	{
		eventPosition = 0;	
	}
	
	
	
	if(nocturnal)
	{
		/*	If the sun is less than out wake up time
			AND greater than our sleep time
			NPC is idle and doing nothing				*/
		if(objSun.currentTime < wakeUp
		   && objSun.currentTime > sleep)
		{
			if(currentState != NPCSTATE.IDLE)
			{
				currentState = NPCSTATE.IDLE; 
				awake = false; 
				startDay = false
			}
		}
		
		/*	We are in a time we should be awake	*/
		else
		{
			if(!awake){awake = true;}
		}
	}
	
	else
	{
		/*	If the sun is less than out wake up time
			or greater than our sleep time
			NPC is idle and doing nothing				*/
		if(objSun.currentTime < wakeUp
		   || objSun.currentTime > sleep)
		{
			if(currentState != NPCSTATE.IDLE)
			{
				currentState = NPCSTATE.IDLE; 
				awake = false; 
				startDay = false
			}
		}
		
		/*	We are in a time we should be awake	*/
		else
		{
			if(!awake){awake = true;}
		}
	}
	

	
	/*	Check if we are awake and havent started our day so we can enter the move state once	*/
	if(awake && !startDay)
	{
		if(currentState != NPCSTATE.MOVE)
		{
			currentState = NPCSTATE.MOVE;
			startDay = true;
		}
	}
	
	/*	Snaps the npc to position after 10 Seconds	*/
	if(objSun.currentTime >= ds_list_find_value(schedule, eventPosition)[? "startTime"] + (10 * 60))
	{
			x = ds_list_find_value(schedule, eventPosition)[? "xPos"];
			y = ds_list_find_value(schedule, eventPosition)[? "yPos"];
			
			tempHomeX = x;
			tempHomeY = y;
			
			reset = false;
			distracted = false;
			needsPlace = true;
			eventPosition++;
	}
#endregion

if(eventPosition >= ds_list_size(schedule))
{
	eventPosition = ds_list_size(schedule)-1
}

#region End of Path
	if(point_distance(x, y, ds_list_find_value(schedule, eventPosition)[? "xPos"], ds_list_find_value(schedule, eventPosition)[? "yPos"]) <= 10)
	{
		if(!needsPlace && currentState == NPCSTATE.MOVE && !reset)
		{
			//show_debug_message("Firing the !needsPlace && currentState == NPCSTATE.MOVE && !reset Loop");
			needsPlace = true;
			eventPosition++;	
		}
	}
#endregion

#region End of Return / Distraction
	if(point_distance(x, y, newX, newY) <= 10)
	{
		if(movingToSpot)
		{
			//show_debug_message("Firing the movingSpot Loop");
			holdNewSpotTimer = newSpotTimer;
			movingToSpot = false
		}
	
		if(reset)
		{
			//show_debug_message("Firing the reset Loop");
			reset = false;
			needsPlace = true;
		}
	
		if(!atPlace)
		{
			//show_debug_message("Firing the not AtPlace Loop");
			atPlace = true;
			needsPlace = true;
		}
	
		if(distracted && ADHD <= 0)
		{
			//show_debug_message("Inside the distracted and ADHD <= 0 Loop");
			distracted = false;	
			needsPlace = true;
		}	
	}
#endregion

if(eventPosition >= ds_list_size(schedule))
{
	eventPosition = ds_list_size(schedule)-1
}


#region Dissapear While Working

	//Waiting for work to end
	if(!is_undefined(ds_list_find_value(schedule, eventPosition)))
	{	
		if(currentState != NPCSTATE.TALKTOPLAYER)
		{
			if(ds_list_find_value(schedule, eventPosition)[? "classification"] == "ENDWORK")
			{
				//check if we are equal to the previous events X and Y
				if(point_distance(x, y, ds_list_find_value(schedule, eventPosition -1)[? "xPos"], ds_list_find_value(schedule, eventPosition -1)[? "yPos"]) <= 20)
				{
					if(!working){working = true};	
				}
		
				if(ds_list_find_value(schedule, eventPosition)[? "startTime"] <= objSun.currentTime)
				{
					if(working){working = false};	
				}
			}
		}
	}
#endregion




