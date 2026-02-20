function wDamage(weapon)
{
	var dmg = weapon[? "baseDmg"];
	var text = "";
	if(dmg > 0)
	{
		text = "+ " + string(dmg) + " Damage,";
	}
	
	return text
}

function wHP(weapon)
{
	var dmg = weapon[? "baseHealth"];
	var text = "";
	if(dmg > 0)
	{
		text = "+ " + string(dmg) + " HP,";
	}
	
	return text
}

function wHealText(effect)
{
	var dmg = effect[? "baseHealing"];
	var text = "";

	dmg += round(objPlayer.maxHp / 3);
	
	text = "Heal " + string(dmg) + " HP,";
	
	return text;
}

function wManaHealText(effect)
{
	var dmg = effect[? "baseHealing"];
	var text = "";

	dmg += round(objPlayer.maxMana / 10);
	
	text = "Heal " + string(dmg) + " Mana,";
	
	return text;
}


function determineWeaponEffects(attackID)
{
	var attack = grabWeapon(attackID);
	var text = "";
	
	if(!is_undefined(attack))
	{
		
		 text = wDamage(attack);
		 text += wHP(attack);
		    // Safety checks
	  
		if (is_undefined(attack) || !ds_map_exists(attack, "Added Effects")) {
		    show_debug_message("applyEffects: attack invalid or has no Effects");
		    return;
		}

		var effectsArray = attack[? "Added Effects"];
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
				case "+": text += " " + wHealText(effect); break;	
				case "+m": text += " " + wManaHealText(effect); break;	
				case "@": text += " " + freezeText(effect); break;	
				case "&": text += " " + bindText(effect); break;
				case "<-": text += " " + selfDamageText(effect, objPlayer); break;
				case "0": text += " " + shieldText(effect); break;
			}

		}
	}
	
	
	return text;
}