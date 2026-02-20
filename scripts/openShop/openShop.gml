// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function openShop(locationData)
{
	objGameController.actionsArray = [];
	
	objGameController.mainText = objGameController.location[? "buyMessage"]
		
	var start = 0;
	var actionList = ds_map_find_value(objGameController.location, "Inventory")
	for(var i = 0; i < ds_list_size(actionList); i++)
	{
		objGameController.actionsArray[i] = ds_list_find_value(actionList, i);
		start++;
	}
	
	if(!is_undefined(objGameController.location[? "reputationInventory"]))
	{
		var repInventory = ds_map_find_value(objGameController.location, "reputationInventory");
		for(var i = 0; i < ds_list_size(repInventory); i++)
		{
			var reputation = ds_list_find_value(repInventory, i)[? "minRep"];
			if(objGameController.curRegion.reputation >= reputation)
			{
				objGameController.actionsArray[i + start] = ds_list_find_value(repInventory, i)
			}
		}
	}
	
	if(objGameController.location[? "questEffect"] != undefined)
	{
		for(var i = 0; i < ds_list_size(objGameController.location[? "questEffect"]); i++)
		{
			var idToGrab = ds_list_find_value(objGameController.location[? "questEffect"], i);
			appendInventory(idToGrab);
		}
	}
}