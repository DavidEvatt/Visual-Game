// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function isCompletedQuest(questID)
{
	var isCompleted = false;
	var quest = grabQuest(questID);
	
	var questIndex = ds_map_find_value(objPlayer.playerBounties, questID)
	
	if(is_undefined(questIndex))
	{
		questIndex = ds_map_find_value(objPlayer.playerQuests, questID)
	}
	
	
	if(questIndex >= ds_list_size(quest[? "states"]))
	{
		isCompleted = true;
	}
	
	return isCompleted;
}