// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dodge(enemyDex, playerDex, turn)
{
	var dodge = false;
	
	var playerDodge = irandom(playerDex) + objPlayer.luck;
	var enemyDodge = irandom(enemyDex) + 1;
	
	show_debug_message("P : " + string(playerDodge) + " | E : " + string(enemyDodge))
	
	if(turn == "PLAYER")
	{
		if(objGameController.curEnemy.frozen or objGameController.curEnemy.bound)
		{
			dodge = true;
		}
		
		else
		{
			if(playerDodge > enemyDodge)
			{
				dodge = true;
			}
		
			else
			{
				dodge = false;	
			}
		}
	}
	
	else
	{
		if(enemyDodge > playerDodge)
		{
			dodge = true;
		}
		
		else
		{
			dodge = false;	
		}
	}
	
	return dodge;
}