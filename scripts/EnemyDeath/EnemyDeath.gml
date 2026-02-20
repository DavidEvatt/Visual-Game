// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyDeath(enemy)
{
	//show_debug_message("EnemyDeath : " + string(is_undefined(enemy)));
	if(instance_exists(enemy))
	{
		show_debug_message("It Exists");	
	}
	if(enemy != noone)
	{
		if(enemy.hp <= 0)
		{
			objTDPlayer.xp += irandom_range(enemy.minExp, enemy.maxExp) + 1;
		
		
			var dropChance = irandom(100) - objTDPlayer.luck;
		
			if(dropChance <= enemy.dropChance)
			{
				var novas = irandom_range(enemy.minCoins, enemy.maxCoins);
				increaseInventory(enemy.materialID, 1);
				objTDPlayer.coins += novas;


				if(novas > 0)
				{
					objMainText.combatDeathtext = "It died and dropped 1 " + grabMaterial(enemy.materialID)[? "Name"] +
												  " and " + string(novas) + " novas!";
				}
			
				else
				{
					objMainText.combatDeathtext = "It died and dropped 1 " + grabMaterial(enemy.materialID)[? "Name"];
				}	
			}
		
			else
			{
					var randomMessage = irandom(100);
				
					if(randomMessage >= 98)
					{
						objMainText.combatDeathtext = "Welp it's dead...."
					}
				
					else if(randomMessage < 98 and randomMessage >= 75)
					{
						objMainText.combatDeathtext = "Where is the mercy?"
					}
				
					else if(randomMessage < 74 and randomMessage >= 50)
					{
						objMainText.combatDeathtext = "It died"
					}
				
					else
					{
						objMainText.combatDeathtext = "You killed a " + enemy.enemyType;
					}
			}
		
			instance_destroy(enemy);
			objGameController.curEnemy = noone;
		
		
			if(!objChoicePanel.leveled)
			{
				objChoicePanel.currentState = CHOICESTATE.COMBATDEATH;
				objMainText.currentState = MAINAREA.COMBATDEATH;
			}
		}
	}
}