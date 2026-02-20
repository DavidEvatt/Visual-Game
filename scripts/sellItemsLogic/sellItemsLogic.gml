// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sellItemsLogic(actionsList)
{
	
	
	if(array_length(actionsList) != 0) // back
	{
		if(actionsList[currentOption] == "Back")
		{
			selectedMaterial[0] = undefined;
			needsBackAdded = true;
			loadFromJson(objGameController.currentNode);
		}
		
		else
		{
			if(selectedMaterial[0] == undefined)
			{
				selectedMaterial[0] = actionsList[currentOption];
			}
		
			if(!is_undefined(selectedMaterial[0]))
			{
				var material = grabMaterial(selectedMaterial[0])
				sellButton = instance_create_layer(1216, 576, "Buttons", objButton);
				sellButton.image_alpha = 0;
				sellButton.modifier = "sell";	
			
				if(!needsSellButton)
				{
					needsSellButton = true;
				
					if(!is_undefined(material))
					{
						var newText = "That is worth " + string(material[? "Cost"]) + "\nHow many would you like to sell?";
						objGameController.mainText = newText;
					}
				
					else {show_debug_message("material is undefined");}
			
					if(needsSellButton)
					{
						sellButton.image_alpha = 1;
						sellPrice = material[? "Cost"];
						objGameController.actionsArray = [];
						objGameController.statAllocationPoints = ds_map_find_value(objPlayer.materialInventory, selectedMaterial[0])
					}
				}
			
				else
				{
					
				}
			}
			else {show_debug_message("sellMaterial[] is undefined");}
		}
	}
			
	else
	{
		objPlayer.coins += (sellPrice * sellButton.curentVal);
		increaseInventory(selectedMaterial[0], -(sellButton.curentVal))
		instance_destroy(sellButton);
		
		selectedMaterial[0] = undefined;
		sellPrice = 0;
		sellButton = noone;
		needsSellButton = false;
		needsBackAdded = true;
		
		loadFromJson(objGameController.currentNode);
		
	}
}