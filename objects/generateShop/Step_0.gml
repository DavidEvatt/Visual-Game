if(shopNeedsCreation)
{
	loadFromJson(shopLocation)
	
	if(!is_undefined(objGameController.location[? "Inventory"]))
	{
		var actionList = ds_map_find_value(objGameController.location, "Inventory")
		if(!is_undefined(actionList))
		{
			if(ds_exists(actionList, ds_type_list))
			{
				show_debug_message("Its a list")	
			}
		
			else show_debug_message("Its not a lsit")
			for(var i = 0; i < ds_list_size(actionList); i++)
			{
				var item = ds_list_find_value(actionList, i);
				if(ds_map_find_value(objTDPlayer.reputationTable, objGameController.location[? "owner"]) >= item[? "minRep"])
				{
					var itemCreate =
					{
						price: item[? "Cost"],
						image: asset_get_index(item[? "image"]),
						itemID: item[? "ID"],
						amount: item[? "total"]
					}
				
				
					show_debug_message("Created Item : " + itemCreate.itemID)
			
					instance_create_layer(273 + (xPlacement * i), 238, "Instances", objItem, itemCreate)
				}
			}
		}
		
		else show_debug_message("actionList is undefined")
	}
	
	else {show_debug_message("Inventory is undefined")}
	
	shopNeedsCreation = false;
	
	/*if(!is_undefined(objGameController.location[? "reputationInventory"]))
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
	
	else {show_debug_message("reputationInventory is undefined")}
	
	if(objGameController.location[? "questEffect"] != undefined)
	{
		for(var i = 0; i < ds_list_size(objGameController.location[? "questEffect"]); i++)
		{
			var idToGrab = ds_list_find_value(objGameController.location[? "questEffect"], i);
			appendInventory(idToGrab);
		}
	}
	
	else {show_debug_message("questEffect is undefined")}
	*/
}








