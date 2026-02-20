
function pHeal(effect)
{
	var dmg = effect[? "BaseHealing"];
	var text = "";

	dmg += round(objTDPlayer.maxHp / 3);
	
	objTDPlayer.hp += dmg;
	
	if(objTDPlayer.hp > objTDPlayer.maxHp)
	{
		objTDPlayer.hp = objTDPlayer.maxHp;	
	}
	
	return text;
}

function pManaHeal(effect)
{
	var dmg = effect[? "BaseHealing"];
	var text = "";

	dmg += round(objTDPlayer.maxMana / 10);
	objTDPlayer.mana += dmg;
	
	if(objTDPlayer.mana > objTDPlayer.maxMana)
	{
		objTDPlayer.mana = objTDPlayer.maxMana;	
	}
	
	text = "Heal " + string(dmg) + " Mana.";
	
	return text;
}

function applyPotionEffects(attackID)
{
	var text = "";
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
			case "+": text += " " + pHeal(effect); break;	
			case "+m": text += " " + pManaHeal(effect); break;	

		}

	}
	
	return text;
}