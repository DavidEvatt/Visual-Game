// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function applyStats(hpBut, strBut, dexBut, mdBut)
{
	objTDPlayer.hp = 10 + hpBut;
	objTDPlayer.maxHp = objTDPlayer.hp;
	
	objTDPlayer.str = 5 + strBut;
	objTDPlayer.dex = 5 + dexBut;
	objTDPlayer.mind = 5 + mdBut;
	objTDPlayer.luck = 1;
	
	objTDPlayer.mana = objTDPlayer.mind * 10;
	objTDPlayer.maxMana = objTDPlayer.mana;
	
	objTDPlayer.xp = 0;
	objTDPlayer.xpToNext = 50;
}