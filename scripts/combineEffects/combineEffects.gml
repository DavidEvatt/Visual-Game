function combineEffects(effect1, effect2)
{
	var effectID = effect1[? "ID"];
	
	switch(effectID)
	{
		case "-":
		{
			
			effect1[? "baseDmg"] += effect2[? "baseDmg"];
			
			if(effect1[? "critChance"] != undefined && effect2[? "critChance"] != undefined)
			{
				effect1[? "critChance"] += effect2[? "critChance"];
			}
			
			else if(effect2[? "critChance"] != undefined)
			{
				effect1[? "critChance"] = effect2[? "critChance"];
			}
			
			if(effect1[? "dexModi"] != undefined && effect2[? "dexModi"] != undefined)
			{
				effect1[? "dexModi"] += effect2[? "dexModi"];
			}
			
			else if(effect2[? "dexModi"] != undefined)
			{
				effect1[? "dexModi"] = effect2[? "dexModi"];
			}
			
			

			break;	
		}
	}
	
	show_debug_message("Combination Sucessful")
	return effect1;
}