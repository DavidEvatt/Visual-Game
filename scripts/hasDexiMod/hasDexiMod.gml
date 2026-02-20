// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hasDexiMod(attackID)
{
	var hasMod = 0;
	
	var attack = grabAttack(attackID)
    // Safety checks
    
    if (is_undefined(attack) || !ds_map_exists(attack, "Effects")) {
        show_debug_message("applyEffects: attack invalid or has no Effects");
        return;
    }

    var effectsArray = attack[? "Effects"];
    if (!ds_exists(effectsArray, ds_type_list)) {
        show_debug_message("applyEffects: Effects is not a ds_list");
        return;
    }

    // Iterate all effects
    for (var i = 0; i < ds_list_size(effectsArray); i++)
    {
        var effect = ds_list_find_value(effectsArray, i);
			
		if(effect[? "dexModi"] != undefined)
		{
			hasMod = effect[? "dexModi"];
		}
			

    }
	
	
	return hasMod;
}