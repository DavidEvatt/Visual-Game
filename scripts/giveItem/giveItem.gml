// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function giveItem(itemID, questID)
{
	if(questID != "none")
	{
		if(itemID != "coin")
		{
			if(ds_map_find_value(objPlayer.materialInventory, itemID) >= 1)
			{
				var value = ds_map_find_value(objPlayer.materialInventory, itemID);
				ds_map_replace(objPlayer.materialInventory, itemID, value-1);	
			}
			
			completeQuest(questID);
		}
	}
	
	else
	{
		if(itemID == "coin")
		{
			if(objPlayer.coins >= 1 && ElderwellActions.curWellCoin < ElderwellActions.maxWellCoin)
			{
				tossACoin();
				objPlayer.coins--;
			}
		}
	}
	
	loadFromJson(objGameController.currentNode)
}