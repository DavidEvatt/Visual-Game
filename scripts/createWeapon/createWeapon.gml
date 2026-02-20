// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createWeapon(materialAry)
{
	var customEffect = ds_list_create();
	var itemExists = false;
	var rarityAry = [];
	
	//create effect librabry for weapon
	for (var i = 0; i < array_length(materialAry); i++)
	{
		var material = grabMaterial(materialAry[i]);
		if(!is_undefined(material))
		{
			var effectsArray = material[? "Effects"];
			rarityAry[i] = material[? "Rarity"];
		
			for (var k = 0; k < ds_list_size(effectsArray); k++)
			{
			    var incoming = ds_list_find_value(effectsArray, k);
			    itemExists = false;

			    // Search existing effects
			    for (var j = 0; j < ds_list_size(customEffect); j++)
			    {
			        var existing = ds_list_find_value(customEffect, j);

			        if (existing[? "ID"] == incoming[? "ID"])
			        {

			            customEffect[| j] = combineEffects(existing, incoming);
			            itemExists = true;
			            break; // STOP searching once matched
			        }
			    }

			    // Only add AFTER full search
			    if (!itemExists)
			    {
			        ds_list_add(customEffect, incoming);
			    }
			}
		}
	}
	
	//enhance base damage based on rarities
	var dmgUpgrade = 0;
	
	for(var i = 0; i < array_length(rarityAry); i++)
	{
		dmgUpgrade += rarityAry[i];	
	}
	
	dmgUpgrade = round(dmgUpgrade /  array_length(rarityAry)) + objGameController.location[? "maxRarity"];
	
	for(var i = 0; i < ds_list_size(customEffect); i++)
	{
		var effect = ds_list_find_value(customEffect, i);
		
		if(!is_undefined(effect[? "baseDmg"]))
		{
			effect[? "baseDmg"] = dmgUpgrade;
		}
	}
	
	return customEffect;
}