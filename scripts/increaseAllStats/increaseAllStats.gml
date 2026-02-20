function increaseAllStats(hpBut, strBut, dexBut, mdBut, luckBut)
{
	objPlayer.maxHp += hpBut;
	objPlayer.hp = objPlayer.maxHp;

	objPlayer.str += strBut;
	objPlayer.dex += dexBut;
	objPlayer.mind += mdBut;
	
	objPlayer.luck += luckBut;
	
	objPlayer.mana = objPlayer.mind * 10;
	objPlayer.maxMana = objPlayer.mana;
	
	objChoicePanel.currentState = CHOICESTATE.JSON;
}