// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function completeQuest(questID)
{
	var quest = grabQuest(questID);
	
	var questIndex = ds_map_find_value(objPlayer.playerQuests, questID);
	ds_map_replace(objPlayer.playerQuests, questID, questIndex + 1);
	
	var rewards = quest[? "rewards"];
	
	for(var i = 0; i < ds_list_size(rewards); i++)
	{
		var curReward = ds_list_find_value(rewards, i);
		
		if(curReward[? "type"] == "coins")
		{
			objPlayer.coins += curReward[? "amount"];	
		}
		
		else
		{
			increaseInventory(curReward[? "type"], curReward[? "amount"])	
		}
	}
}