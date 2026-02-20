// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function copyEnemyStateHeal()
{
	hp += 5;
	if(hp > maxHp){hp = maxHp};
	
	currentState = ENEMYSTATE.IDLE
}