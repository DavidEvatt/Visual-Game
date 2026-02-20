// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function cDamageText()
{
	var text = "Damage,";
	return text;
}

function cFreezeText()
{
	var text = "Freeze Chance,";
	
	return text;
}

function determineMaterialEffects(craftingID)
{
	var text = "";
	var craftingMat = grabMaterial(craftingID)
	    // Safety checks
	  
	if (is_undefined(craftingMat) || !ds_map_exists(craftingMat, "Effects")) {
	    show_debug_message("applyEffects: attack invalid or has no Effects");
	    return;
	}

	var effectsArray = craftingMat[? "Effects"];
	if (!ds_exists(effectsArray, ds_type_list)) {
	    show_debug_message("applyEffects: Effects is not a ds_list");
	    return;
	}

	// Iterate all effects
	for (var i = 0; i < ds_list_size(effectsArray); i++)
	{
	    var effect = ds_list_find_value(effectsArray, i);
		var effectId = effect[? "ID"];
			
		switch(effectId)
		{
			case "-": text += " " + cDamageText(); break;	
			case "@": text += " " + cFreezeText(); break;	

		}

	}
	
	return text;
}