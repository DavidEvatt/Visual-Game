// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function craftingWeaponLogics()
{
	if(objGameController.actionsArray[currentOption] == "Back") // back
	{
		craftingIndex[0] = -1;
		craftingIndex[1] = -1;
		craftingIndex[2] = -1;
		selectedMaterial[0] = undefined;
		selectedMaterial[1] = undefined;
		selectedMaterial[2] = undefined;
		namingWeapon = false;
		timeToBuy = false;
		needsBackAdded = true;
		loadFromJson(objGameController.currentNode);
	}
			
	else
	{
		if(!namingWeapon && !timeToBuy)
		{
			if(crafting != 0)
			{
				for(var i = 0; i < array_length(craftingIndex); i++)
				{
					if(craftingIndex[i] = -1)
					{
						craftingIndex[i] = currentOption;
						
						
						selectedMaterial[i] = objGameController.actionsArray[currentOption];
						//show_debug_message("Added " + selectedMaterial[i] + " to the array | Cur Option = " + string(currentOption));
						crafting--;
						break;
					}
				
		
					else if(craftingIndex[i] = currentOption)
					{
						//show_debug_message("Removed " + selectedMaterial[i] + " from the array | Cur Option = " + string(currentOption));
						craftingIndex[i] = -1;
						selectedMaterial[i] = undefined
						

						crafting++
						break;
					}
				}
			}
			
			else
			{
				namingWeapon = true;
				tempPlayerName = "";
				var arry = createWeapon(selectedMaterial);
					
				weaponEffectArray = createWeapon(selectedMaterial);
			}
		}
			
		else if(namingWeapon)
		{
			weaponName = tempPlayerName;
			namingWeapon = false;
			timeToBuy = true;
				
			cost = objGameController.location[? "maxRarity"] * 10;
			for(var i = 0; i < array_length(selectedMaterial); i++)
			{
				var mat = grabMaterial(selectedMaterial[i]);
				cost += (mat[? "Cost"] + mat [? "Rarity"]) * 10
			}
				
			currentOption = 0;
					
			var buyText = "It is worth " + string(cost) + " coins!"
			if(objGameController.mainText != buyText)
			{
				objGameController.mainText = buyText;
				objGameController.actionsArray = [];
				objGameController.actionsArray[0] = "Buy"
				objGameController.actionsArray[1] = "Leave"

			}
		}
			
		else if(timeToBuy)
		{
			if(objGameController.actionsArray[currentOption] == "Buy")
			{
				if(objPlayer.coins >= cost)
				{
					var effectsArray = [];
					var baseDam = 0;

					for (var i = ds_list_size(weaponEffectArray) - 1; i >= 0; i--)
					{
						var effectMap = ds_list_find_value(weaponEffectArray, i);
						if (effectMap[? "ID"] == "-")
						{
							baseDam += effectMap[? "baseDmg"];
							ds_list_delete(weaponEffectArray, i);
						}
						else
						{
							var effectStruct = mapToStruct(effectMap);
							array_push(effectsArray, effectStruct);
						}
					}
					
					var partColors = [];
					
					
					for(var k = 0; k < array_length(selectedMaterial); k++)
					{
						var curColor = ds_map_find_value(objGameController.craftingColors, selectedMaterial[k])
						
						var colorPos = 
						{
							R: color_get_red(curColor),
							G: color_get_green(curColor),
							B: color_get_blue(curColor)
						}
						
						array_push(partColors, colorPos);
					}

					var customWeapon = 
					{
						ID   : weaponName,
						Name : weaponName,
						type : "weapon",
						baseDmg : baseDam,
						baseMDmg : 0,
						baseHealth : 0,
						baseMana : 0,
						desc : "A custom weapon you had made by " + objGameController.location[? "maker"]
					};
						
					customWeapon[$ "Added Effects"] = effectsArray
					customWeapon[$ "Part Colors"] = partColors
					saveCustomWeapons(customWeapon);
					ds_list_add(objPlayer.obtainedWeapons, customWeapon.ID)
							
					objGameController.weaponList = [];
					loadInWeapons("weapons.json");
							
					for(var m = 0; m < array_length(craftingIndex); m++)
					{
						increaseInventory(selectedMaterial[m], -1);
					}
						
					craftingIndex[0] = -1;
					craftingIndex[1] = -1;
					craftingIndex[2] = -1;
					selectedMaterial[0] = undefined;
					selectedMaterial[1] = undefined;
					selectedMaterial[2] = undefined;
					namingWeapon = false;
					timeToBuy = false;
					needsBackAdded = true;
							
					loadFromJson(objGameController.currentNode);
				}
					
				else
				{
					objGameController.mainText += " Not enough money.";
					craftingIndex[0] = -1;
					craftingIndex[1] = -1;
					craftingIndex[2] = -1;
					selectedMaterial[0] = undefined;
					selectedMaterial[1] = undefined;
					selectedMaterial[2] = undefined;
					namingWeapon = false;
					timeToBuy = false;
					needsBackAdded = true;
					loadFromJson(objGameController.currentNode);
				}
			}
				
			else if (objGameController.actionsArray[currentOption] == "Leave")
			{
				craftingIndex[0] = -1;
				craftingIndex[1] = -1;
				craftingIndex[2] = -1;
				selectedMaterial[0] = undefined;
				selectedMaterial[1] = undefined;
				selectedMaterial[2] = undefined;
				namingWeapon = false;
				timeToBuy = false;
				needsBackAdded = true;
				loadFromJson(objGameController.currentNode);
			}
		}
	}	
}