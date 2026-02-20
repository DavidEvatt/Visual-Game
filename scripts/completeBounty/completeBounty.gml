// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//make sure that they player has neccisary resources


function completeBounty(questID)
{
	var canComplete = false;
	var quest = grabQuest(questID);
	
	var questIndex = ds_map_find_value(objPlayer.playerBounties, questID);
	
	var bountyList = quest[? "states"];
	var bountyType = ds_list_find_value(bountyList, questIndex);
	
	switch(bountyType[? "type"])
	{
		case "gather":
		{
			show_debug_message("case is gather");
			if(!is_undefined(bountyType[? "itemID"]))
			{
				show_debug_message("Item ID is not underfined");
				if(ds_map_find_value(objPlayer.materialInventory, bountyType[? "itemID"]) >= bountyType[? "amtNeeded"])
				{
					show_debug_message("worked");
					canComplete = true;
					increaseInventory(bountyType[? "itemID"], -bountyType[? "amtNeeded"]);
				}
				
				else
				{
					show_debug_message("Not enough resources");	
				}
			}
			
			else
			{
				show_debug_message("Item ID is underfined");	
			}
			break;	
		}
	}
	
	var rewards = quest[? "rewards"];
	
	for(var i = 0; i < ds_list_size(rewards); i++)
	{
		var curReward = ds_list_find_value(rewards, i);
		
		if(curReward[? "type"] == "coins")
		{
			objPlayer.coins += curReward[? "amount"];	
		}
		
		else if(curReward[? "type"] == "reputation")
		{
			objGameController.curRegion.reputation += curReward[? "amount"];	
			
		}
		
		else
		{
			increaseInventory(curReward[? "type"], curReward[? "amount"])	
		}
	}
	
	ds_map_replace(objPlayer.playerBounties, questID, questIndex + 1);
}