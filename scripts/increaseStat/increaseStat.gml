// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increaseStat(type)
{
	switch(type)
	{
		case "health": {objTDPlayer.maxHp++; break;}
		
		case "strength": {objTDPlayer.str++; break;}
		
		case "dexterity": {objTDPlayer.dex++; break;}
		
		case "mind": {objTDPlayer.mind++; objTDPlayer.maxMana = objTDPlayer.mind * 10; break;}
		
		case "luck": {objTDPlayer.luck++; break;}
	}
}