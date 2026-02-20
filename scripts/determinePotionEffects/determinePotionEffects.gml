
function pHealText(effect)
{
	var dmg = effect[? "BaseHealing"];
	var text = "";

	dmg += round(objPlayer.maxHp / 3);
	
	text = "Heal " + string(dmg) + " HP.";
	
	return text;
}

function pManaHealText(effect)
{
	var dmg = effect[? "BaseHealing"];
	var text = "";

	dmg += round(objPlayer.maxMana / 10);
	
	text = "Heal " + string(dmg) + " Mana.";
	
	return text;
}

function determinePotionEffects(attackID)
{
	var text = "Amount: " + string(objPlayer.potionInventory[? attackID]) + ",";
	var attack = grabPotion(attackID)
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
		var effectId = effect[? "ID"];
			
		switch(effectId)
		{
			case "+": text += " " + pHealText(effect); break;	
			case "+m": text += " " + pManaHealText(effect); break;	

		}

	}
	
	return text;
}