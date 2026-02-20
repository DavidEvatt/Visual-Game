// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increaseStat(type)
{
	switch(type)
	{
		case "health": {objPlayer.maxHp++; break;}
		
		case "strength": {objPlayer.str++; break;}
		
		case "dexterity": {objPlayer.dex++; break;}
		
		case "mind": {objPlayer.mind++; objPlayer.maxMana = objPlayer.mind * 10; break;}
		
		case "luck": {objPlayer.luck++; break;}
	}
}