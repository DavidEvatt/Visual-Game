// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function appendActions(questID)
{
	var stateVal = ds_map_find_value(objPlayer.playerBounties, questID);
	
	if(is_undefined(stateVal))
	{
		stateVal = ds_map_find_value(objPlayer.playerQuests, questID);
	}
	
	
	var start = array_length(objGameController.actionsArray);
	
	var quest = grabQuest(questID);
	
	if(stateVal < ds_list_size(quest[? "states"]))
	{
		var questStates = quest[? "states"];
		var questActions = ds_list_find_value(questStates, stateVal)[? "appendActions"]
	
		if(!is_undefined(questActions))
		{
			for(var i = 0; i < ds_list_size(questActions); i++)
			{
				var locationToAppend =  ds_list_find_value(questActions, i)[? "locationAppear"]
				
				if(string_pos(locationToAppend, objGameController.currentNode) > 0)
				{
					objGameController.actionsArray[i + start] = ds_list_find_value(questActions, i);
				}
			}
		}
	}
}