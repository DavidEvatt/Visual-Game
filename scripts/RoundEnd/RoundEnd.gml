// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoundEnd()
{
	//mana regen
	objPlayer.mana = min(objPlayer.mana + 2, objPlayer.maxMana);
	
	eDmgNumber = 0;
	dmgNumber = 0;
	
	//undo debufs
	if(objGameController.curEnemy.frozen && objGameController.curEnemy.curFreezeDur > 0)
	{
		objGameController.curEnemy.curFreezeDur--;
	}
	
	else if(objGameController.curEnemy.frozen)
	{
		objGameController.curEnemy.frozen = false;
	}
	
	if(objGameController.curEnemy.bound && objGameController.curEnemy.curBindDur > 0)
	{
		objGameController.curEnemy.curBindDur--;
	}
	
	else if(objGameController.curEnemy.bound)
	{
		objGameController.curEnemy.bound = false;
	}
	
	if(objPlayer.shield && objPlayer.curShieldDur > 0)
	{
		objPlayer.curShieldDur--;
	}
	
	else if(objPlayer.shield)
	{
		objPlayer.shield = false;
		objPlayer.maxShieldDur = 0;
	}
}
