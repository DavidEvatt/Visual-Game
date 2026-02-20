// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buyItems(sendBack, cost, itemID)
{
	var item = grabWeapon(itemID);
	var type = "weapon";
	
	for(var i = 0; is_undefined(item); i++)
	{
		switch(i)
		{
			case 0: item = grabPotion(itemID); type = "potion"; break;
			case 1: item = grabAttack(itemID); type = "attack"; break;
			case 2: item = grabMaterial(itemID); type = "material"; break;
		}
	}
	
	switch(type)
	{
		case "weapon":
		{
			if(!listContains(objPlayer.obtainedWeapons, itemID))
			{
				ds_list_add(objPlayer.obtainedWeapons, itemID);
			}
			break;
		}
		
		case "potion":
		{
			if(ds_map_exists(objPlayer.potionInventory, itemID))
			{
				var val = ds_map_find_value(objPlayer.potionInventory, itemID);
				if(!listContains(objPlayer.knownPotions, itemID))
				{
					ds_list_add(objPlayer.knownPotions, itemID)
				}
				
				ds_map_replace(objPlayer.potionInventory, itemID, val + 1);
			}
			break;
		}
		
		case "attack":
		{
			
			if(!listContains(objPlayer.knownAttacks, itemID))
			{
				ds_list_add(objPlayer.knownAttacks, itemID);
			}
			break;
		}
		
		case "material":
		{
			if(ds_map_exists(objPlayer.materialInventory, itemID))
			{
				var val = ds_map_find_value(objPlayer.materialInventory, itemID);
				ds_map_replace(objPlayer.materialInventory, itemID, val + 1);
			}
			break;
		}
		
	}
	
	//show_debug_message(weapon[? "Name"] + ": It costs " + string(cost) + " send back location is " + sendBack)
	loadFromJson(sendBack);
}