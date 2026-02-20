// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function npcStateMoveTo()
{
	#region New Moving Logic
	if(objSun.currentTime >=  ds_list_find_value(schedule, 0)[? "startTime"] && objSun.currentTime < ds_list_find_value(schedule, ds_list_size(schedule) -1)[? "startTime"]) //we are for sure awake
	{	
		if(ADHD <= 0 && !distracted)
		{
			
			var path = path_add();
		
			if(trailBlaze)
			{
				mp_grid_path(objGameController.worldMap, path, x, y, ds_list_find_value(schedule, eventPosition)[? "xPos"], ds_list_find_value(schedule, eventPosition)[? "yPos"], true);
			}
		
			else
			{
				mp_grid_path(objGameController.townMap, path, x, y, ds_list_find_value(schedule, eventPosition)[? "xPos"], ds_list_find_value(schedule, eventPosition)[? "yPos"], true);
			}
		
			var leaveTime =  ds_list_find_value(schedule, eventPosition)[? "startTime"] - (path_get_length(path) / pathSpd);
		
			show_debug_message(leaveTime)
			
			if(objSun.currentTime >= leaveTime && needsPlace)
			{
				show_debug_message("Setting a new path");
				path_start(path, pathSpd, path_action_stop, 0)
				needsPlace = false;
			}
		}
		
		else if(ADHD <= 0 && distracted && reset)
		{
			if(needsPlace)
			{
				show_debug_message("Returning to path");
				var path = path_add();
				mp_grid_path(objGameController.worldMap, path, x, y, tempHomeX, tempHomeY, true);
				path_start(path, pathSpd, path_action_stop, 0)
				needsPlace = false;
			}
		}
		
	}
	
	#endregion
	
	#region Distraction Logic
		var distractionChance = irandom_range(0, 100);
		if(!distracted && ADHD <= 0 && dps <= 0)
		{
			show_debug_message(string(distractionChance) + " | " + string(attentionSpan))
			if(distractionChance >= attentionSpan)
			{
				path_end();
				tempHomeX = x;
				tempHomeY = y;
				distracted = true
				movingToSpot = false;
				holdNewSpotTimer = 0;
				ADHD = maxADHD;
				currentState = NPCSTATE.DISTRACTED;
			}
			
			else {dps = 300;}
		}
	#endregion
	
	#region Talking Logic
		/*distractionChance = irandom_range(0, 100);
		var npc = instance_nearest(x, y, objNPC);
		if(distractionChance <= attentionSpan && distance_to_object(npc) <= talkingRange && npc != id)
		{
			talkLength = maxTalkLength;
			path_speed = 0;
			currentState = NPCSTATE.DISTRACTED;
		}*/
	#endregion
}