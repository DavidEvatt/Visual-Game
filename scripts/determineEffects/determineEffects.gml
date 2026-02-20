// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function damageText(effect, target)
{
	var dmg = effect[? "baseDmg"];
	var text = "";
	var type = effect[? "type"];
	
	if(type == "physical" && objPlayer.weapon != undefined)
	{
		var weapon = grabWeapon(objPlayer.weapon);
		dmg += weapon[? "baseDmg"];
		
		if(objPlayer.str >= 10)
		{
			dmg *= round(objPlayer.str / 10)
		}
	}
	
	else if(type == "magical" && objPlayer.weapon != undefined)
	{
		if(objPlayer.mind >= 10)
		{
			dmg *= round(objPlayer.mind / 10)
		}
	}
	
	if (type == "magical") {dmg -= round(dmg * target.magicalRes);}
    else if (type == "physical") {dmg -= round(dmg * target.physicalRes);}
	
	text = "Damage: " + string(dmg) + ",";
	
	return text;
}

function selfDamageText(effect, target)
{
	var dmg = effect[? "baseDmg"];
	var text = "";

	if(objPlayer.mind >= 10)
	{
		dmg *= round(objPlayer.mind / 10)
	}
	
	var type = effect[? "type"];
	
	if (type == "magical") {dmg -= round(dmg * objPlayer.magicalRes);}
    else if (type == "physical") {dmg -= round(dmg * objPlayer.physicalRes);}
	
	text = "Self Damage: " + string(dmg) + ",";
	
	return text;
}

function healingText(effect, target)
{
	var dmg = effect[? "baseHealing"];
	var text = "";

	if(objPlayer.mind >= 10)
	{
		dmg *= round(objPlayer.mind / 10)
	}
	
	var type = effect[? "type"];
	
	if (type == "magical") {dmg -= round(dmg * target.magicalRes);}
    else if (type == "physical") {dmg -= round(dmg * target.physicalRes);}
	
	text = "Healing: " + string(dmg) + ",";
	
	return text;
}

function freezeText(effect)
{
	var dmg = effect[? "freezeChance"];
	var text = "";

	text = "Freeze Chance: " + string(dmg) + "%,";
	
	return text;
}

function bindText(effect)
{
	var dmg = effect[? "bindChance"];
	var text = "";

	text = "Bind Chance: " + string(dmg) + "%,";
	
	return text;
}

function shieldText(effect)
{
	var duration = effect[? "shieldDuration"];
	var text = "";
	
	text = "Shield Duration: " + string(duration) + ",";
	
	return text;
}

function unstableText(effect)
{
	var text = "Cast Random: " + string(effect[? "spellCount"]) + ",";
	return text;
}

function determineEffects(attackID, target)
{
	var text = "";
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
		var effectId = effect[? "ID"];
			
		switch(effectId)
		{
			case "-": text += " " + damageText(effect, target); break;	
			case "@": text += " " + freezeText(effect); break;	
			case "&": text += " " + bindText(effect); break;
			case "+": text += " " + healingText(effect, target); break;	
			case "<-": text += " " + selfDamageText(effect, target); break;
			case "0": text += " " + shieldText(effect); break;
			case "#": text += " " + unstableText(effect); break;

		}

	}
	
	return text;
}