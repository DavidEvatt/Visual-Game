// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function appendInventory(questID)
{
	var quest = grabQuest(questID)
	var start = array_length(objGameController.actionsArray);
	
	if(!is_undefined(quest))
	{
		if(isCompletedQuest(questID))
		{
			var questStates = quest[? "AppendInventory"];
			var questActions = ds_list_find_value(questStates, quest)[? "actionDescription"]
	
			if(!is_undefined(questActions))
			{
				for(var i = 0; i < ds_list_size(questActions); i++)
				{
					objGameController.actionsArray[i + start] = ds_list_find_value(questActions, i);
				}
			}
		}
	}
}