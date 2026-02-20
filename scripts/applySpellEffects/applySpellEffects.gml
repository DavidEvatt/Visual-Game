// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function applySpellEffects()
{
	var dmgNum = 0;
	var attack = grabAttack(objTDPlayer.mAttacks[3])
    // Safety checks
    if (!is_undefined(target) && instance_exists(target)) 
	{
        var effectsArray = attack[? "Effects"];
        // Iterate all effects
		
	    for (var i = 0; i < ds_list_size(effectsArray); i++)
	    {
	        var effect = ds_list_find_value(effectsArray, i);
			var effectId = effect[? "ID"];
			
			switch(effectId)
			{
				case "-": dmgNum += attack[? "baseDmg"]; break;
				case "@": Freeze(target, effect, turn); break;	
				case "&": Bind(target, effect, turn); break;
				case "+": Healing(target, effect, turn); break;
				case "<-": SelfDamage(target, effect, turn); break;
				case "0": Shield(effect, turn); break;
				case "#": dmgNum += Unstable(attack, effect, turn); break;
			}
	    }
		
	  } 
	
	else 
	{
        show_debug_message("applyEffects: target is undefined or does not exist");
    }
	
	return dmgNum;
}