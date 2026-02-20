// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tossACoin()
{
	var chance = irandom(100) - objPlayer.luck;
	ElderwellActions.curWellCoin++;
	
	if(chance > 10)
	{
		show_debug_message("nothing");
	}
	
	else if(chance <= 10 && chance > 1)
	{
		var stat = irandom(4) + 1;
		
		switch (stat)
		{
			case 1: increaseStat("health") break;
			case 2: increaseStat("strength") break;
			case 3: increaseStat("dexterity") break;
			case 4: increaseStat("mind") break;
			case 5: increaseStat("luck") break;
		}
	}
	
	else
	{
		increaseAllStats(1, 1, 1, 1, 1)	
	}
	
	
}