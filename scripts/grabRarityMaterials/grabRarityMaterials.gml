// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabRarityMaterials(rarity)
{
	var returnAry = [];
	var hole = 0;
	var keys = ds_map_keys_to_array(objPlayer.materialInventory) //returns ID's
	
	for (var i = 0; i < array_length(keys); i++)
	{
	    var currentKey = keys[i];
		var materialAmt = ds_map_find_value(objPlayer.materialInventory, currentKey);
		
		var material = grabMaterial(currentKey);
		
		if(!is_undefined(material))
		{
			if(material[? "Rarity"] <= rarity && material[? "ID"] != 0 && material[? "Rarity"] >= 0 && materialAmt > 0)
			{
				returnAry[i - hole] = currentKey
			}
			
			else hole++;
		}
		
		else hole++;
	}
	
	return returnAry;
}