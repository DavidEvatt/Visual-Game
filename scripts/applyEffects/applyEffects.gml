/// @desc Damage effect implementation
/// @param target Instance of enemy
/// @param effect DS list with attack data

function Damage(target, weapon)
{
	var dmg = 0;
	
	if(weapon[? "type"] == "STAFF")
	{
		dmg = applySpellEffects();
		show_debug_message("staff Dmage: " + string(dmg))
		if(objTDPlayer.mind >= 10){dmg += round(objTDPlayer.mind / 10)}
		dmg += weapon[? "baseDmg"];
		
		dmg -= round(dmg * target.magicalRes);
	}
	
	else
	{
		dmg = weapon[? "baseDmg"];
		if(objTDPlayer.str >= 10){dmg += round(objTDPlayer.str / 10)}
		dmg -= round(dmg * target.physicalRes);
	}
	
	var dexRoll = irandom_range(0, objTDPlayer.dex);
	
	if(dexRoll + objTDPlayer.luck >= objTDPlayer.dex){dmg *= 2};

	return dmg;
    //show_debug_message("Applied " + string(dmg) + " damage to " + target.enemyType);
}

function Healing(target, effect, turn)
{
    var dmg = 0;

    if (ds_map_exists(effect, "baseHealing")) 
	{
        dmg += effect[? "baseHealing"];
    }


    // Damage type adjustments
    if (effect[? "type"] == "magical") {dmg -= round(dmg * target.magicalRes);}
    else if (effect[? "type"] == "physical") {dmg -= round(dmg * target.physicalRes);}

	if(turn == "PLAYER")
	{
		if(objPlayer.mind >= 10)
		{
			dmg += round(objPlayer.mind / 10);
		}
	}
    

	objPlayer.hp = min(objPlayer.hp + dmg, objPlayer.maxHp);

	return dmg;
    //show_debug_message("Applied " + string(dmg) + " damage to " + target.enemyType);
}

function SelfDamage(target, effect, turn)
{
    var dmg = 0;

    if (ds_map_exists(effect, "baseDmg")) 
	{
        dmg += effect[? "baseDmg"];
    }

	if(turn == "PLAYER")
	{
		if(effect[? "type"] == "physical")
		{
			if(objPlayer.str >= 10)
			{
				dmg += round(objPlayer.str / 10);
			}
			
			dmg -= round(dmg * objPlayer.physicalRes);
		}
		
		else if(effect[? "type"] == "magical")
		{
			if(objPlayer.mind >= 10)
			{
				dmg += round(objPlayer.mind / 10);
			}
			
			dmg -= round(dmg * objPlayer.magicalRes);
		}
		
		objPlayer.hp = max(0, objPlayer.hp - dmg);
	}
	
	else
	{
		if(effect[? "type"] == "physical")
		{
			if(objGameController.curEnemy.str >= 10)
			{
				dmg += round(objGameController.curEnemy.str / 10);
			}
			
			dmg -= round(dmg * objGameController.curEnemy.physicalRes);
		}
		
		else if(effect[? "type"] == "magical")
		{
			if(objGameController.curEnemy.mind >= 10)
			{
				dmg += round(objGameController.curEnemy.mind / 10);
			}
			
			dmg -= round(dmg * objGameController.curEnemy.magicalRes);
		}
		
		objGameController.curEnemy.hp = max(0, objGameController.curEnemy.hp - dmg);
	}

	return dmg;
    //show_debug_message("Applied " + string(dmg) + " damage to " + target.enemyType);
}

function Freeze(target, effect, turn)
{
	var freezeChance = 0;
	if(turn == "PLAYER")
	{
		if (ds_map_exists(effect, "freezeChance")) 
		{
	        freezeChance = effect[? "freezeChance"];
	    }
		
		var diceRoll = irandom(100) - objPlayer.luck;
		
		if(diceRoll <= effect[? "freezeChance"])
		{
			target.frozen = true;
			target.curFreezeDur = target.maxFreezeDur
		}
	}
}

function Bind(target, effect, turn)
{
	var bindChance = 0;
	if(turn == "PLAYER")
	{
		if (ds_map_exists(effect, "bindChance")) 
		{
	        freezeChance = effect[? "bindChance"];
	    }
		
		var diceRoll = irandom(100) - objPlayer.luck;
		
		if(diceRoll <= effect[? "bindChance"])
		{
			target.bound = true;
			target.curBindDur = target.maxBindDur;
		}
	}
}

function Shield(effect, turn)
{
	if(turn == "PLAYER")
	{
		objPlayer.maxShieldDur += effect[? "shieldDuration"];
		objPlayer.curShieldDur = objPlayer.maxShieldDur;
		objPlayer.shield = true;
	}
}

function Unstable(attack, effect, turn)
{
	var dmgNum = 0;
	show_debug_message("Boss, its unstable")

	if(turn == "PLAYER")
	{
		var extraAttack = effect[? "spellCount"];
	
		for(var i = 0; i < extraAttack; i++)
		{
			var randomAttack = irandom( ds_list_size(objPlayer.knownAttacks) -1);
			if(ds_list_find_value(objPlayer.knownAttacks, randomAttack) != undefined)
			{
				var playerEvent =
				{
					type: "attack",
					actor: objPlayer,
					target: objGameController.curEnemy,
					attackID: ds_list_find_value(objPlayer.knownAttacks, randomAttack)
				};
				show_debug_message("Added " + playerEvent.attackID);
				ds_list_add(objChoicePanel.combatQueue, playerEvent);
				
				//dmgNum += applyEffects(objGameController.curEnemy, ds_list_find_value(objPlayer.knownAttacks, randomAttack), turn)
			}
		}
	}
	
	return dmgNum;
}

/// @desc Applies all effects of an attack to a target
/// @param target Instance of enemy
/// @param attack DS map with attack data
function applyEffects(target, weaponID, turn)
{
	var dmgNum = 0;
	var weapon = grabWeapon(weaponID)
    // Safety checks
    if (!is_undefined(target) && instance_exists(target)) 
	{
		if(!is_undefined(weapon))
		{
			var effectsArray = weapon[? "Added Effects"];

	        // Iterate all effects
			if(!is_undefined(target) && target.hp > 0 && target != noone && !is_undefined(effectsArray))
			{
		        for (var i = 0; i < ds_list_size(effectsArray); i++)
		        {
		            var effect = ds_list_find_value(effectsArray, i);
					var effectId = effect[? "ID"];
			
					switch(effectId)
					{
						case "-": dmgNum += Damage(target, weapon); break;
						case "@": Freeze(target, effect, turn); break;	
						case "&": Bind(target, effect, turn); break;
						case "+": Healing(target, effect, turn); break;
						case "<-": SelfDamage(target, effect, turn); break;
						case "0": Shield(effect, turn); break;
						case "#": dmgNum += Unstable(weapon, effect, turn); break;
					}
		        }
			}
		}
	  } 
	
	else 
	{
        show_debug_message("applyEffects: target is undefined or does not exist");
    }
	
	target.hp -= dmgNum;
	
	return dmgNum;
}