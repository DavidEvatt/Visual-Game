/// @description Interact Key

npc = instance_nearest(x,y ,objNPC);
if(distance_to_object(npc) <= talkingRange && !npc.working && npc != noone)
{
	if(npc.currentState != NPCSTATE.TALKTOPLAYER)
	{
		npc.path_speed = 0;
		npc.charCount = 0;
		talkingToNpc = true;
		npc.currentState =  NPCSTATE.TALKTOPLAYER;
		
		objGameController.actionsArray = []
		
		var actionList = npc.actions
		
		if(!is_undefined(actionList))
		{
			for(var i = 0; i < ds_list_size(actionList); i++)
			{
				objGameController.actionsArray[i] = ds_list_find_value(actionList, i);
			}
		}
		
		show_debug_message("Action List is undefined");
	}
	
	else
	{
		npc.path_speed = npc.pathSpd;
		npc.charCount = 0;
		npc.currentState =  NPCSTATE.MOVE;
		objChoicePanel.currentState = CHOICESTATE.JSON;
		objChoicePanel.charCount = 0;

	}
}

var well = instance_nearest(x, y, objWell);
if(distance_to_object(well) <= 20)
{
	if(coins >= 0)
	{
		tossACoin();
		coins--;
	}
	
	else
	{
		show_debug_message("no coins");	
	}
}