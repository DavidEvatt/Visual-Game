function increaseAllStats(hpBut, strBut, dexBut, mdBut, luckBut)
{
	objTDPlayer.maxHp += hpBut;
	objTDPlayer.hp = objTDPlayer.maxHp;

	objTDPlayer.str += strBut;
	objTDPlayer.dex += dexBut;
	objTDPlayer.mind += mdBut;
	
	objTDPlayer.luck += luckBut;
	
	objTDPlayer.mana = objTDPlayer.mind * 10;
	objTDPlayer.maxMana = objTDPlayer.mana;
	
	objChoicePanel.currentState = CHOICESTATE.JSON;
}