// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabTypeMaterials(type, type2, region)
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
			if(type == "all" || type2 == "all")
			{
				if(material[? "region"] == region && material[? "ID"] != "0" && material[? "purpose"] != "none" && materialAmt > 0)
				{
					returnAry[i - hole] = currentKey
				}
			
				else hole++;
			}
			
			else
			{
				if(material[? "purpose"] == type || material[? "purpose"] == type2 && material[? "region"] == region
				   && material[? "ID"] != "0" && material[? "purpose"] != "none" && materialAmt > 0)
				{
					returnAry[i - hole] = currentKey
				}
			
				else hole++;
			}
			
		}
		
		else hole++;
	}
	
	return returnAry;
}