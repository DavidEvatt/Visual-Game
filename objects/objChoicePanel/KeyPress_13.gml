

switch(currentState)
{
	case CHOICESTATE.NEEDSPAUSE:
	{
		loadFromJson(objGameController.currentNode);
	}
	
	case CHOICESTATE.COMBATDEATH:
	{
		loadFromJson(objGameController.currentNode)
		
		break;
	}
	
	case CHOICESTATE.LEVELUP:
	{
		if(objGameController.statAllocationPoints <= 0)
		{
			
			if(leveled)
			{
				increaseAllStats(objMainText.healthButton.curentVal,
					   objMainText.strengthButton.curentVal,
					   objMainText.dexterityButton.curentVal,
					   objMainText.mindButton.curentVal, 0)
			
				instance_destroy(objMainText.healthButton);
				instance_destroy(objMainText.strengthButton);
				instance_destroy(objMainText.dexterityButton);
				instance_destroy(objMainText.mindButton);
			
				objGameController.characterExists = true;
				leveled = false;
			}
			
			
			loadFromJson(objGameController.currentNode)
		}
		break;	
	}
	
	case CHOICESTATE.CREATION:
	{
		if(objGameController.statAllocationPoints <= 0)
		{
			
			
			
			applyStats(objMainText.healthButton.curentVal,
					   objMainText.strengthButton.curentVal,
					   objMainText.dexterityButton.curentVal,
					   objMainText.mindButton.curentVal)
			
			instance_destroy(objMainText.healthButton);
			instance_destroy(objMainText.strengthButton);
			instance_destroy(objMainText.dexterityButton);
			instance_destroy(objMainText.mindButton);
			
			objGameController.characterExists = true;
			objMainText.currentState = MAINAREA.NAMING;
			currentState = CHOICESTATE.NAMING;
			tempPlayerName = "";
			keyboard_string = "";
		}
		break;	
	}
	
	case CHOICESTATE.NAMING:
	{
		objPlayer.Name = tempPlayerName;
		currentState = CHOICESTATE.MONTHSELECTION;
		objMainText.currentState = MAINAREA.MONTHSELECT;
		
		break;
	}
	
	case CHOICESTATE.MONTHSELECTION:
	{
		objTDPlayer.month = monthSelect[currentOption];
		
		switch(objTDPlayer.month)
		{
			case monthSelect[0]: objTDPlayer.maxHp += 2; objTDPlayer.hp += 2; break;
			case monthSelect[1]: objTDPlayer.str += 2; break;
			case monthSelect[2]: objTDPlayer.dex += 2; break;
			case monthSelect[3]: objTDPlayer.mind += 2; break;
			case monthSelect[4]: objTDPlayer.luck += 2; break;
		}
		
		currentState = CHOICESTATE.DAYSELECTION;
		objMainText.currentState = MAINAREA.DAYSELECT;
		
		break;	
	}
	
	case CHOICESTATE.DAYSELECTION:
	{
		objTDPlayer.day = objMainText.daySelector.curentVal;
		
		if(objTDPlayer.day > 0 && objTDPlayer.day <= 3)
		{
			objTDPlayer.maxHp++;
			objTDPlayer.hp++;
		}
		
		else if(objTDPlayer.day > 3 && objTDPlayer.day <= 6)
		{
			objTDPlayer.str++;
		}
		
		else if(objTDPlayer.day > 6 && objTDPlayer.day <= 9)
		{
			objTDPlayer.dex++;
		}
		
		else if(objTDPlayer.day > 9 && objTDPlayer.day <= 12)
		{
			objTDPlayer.mind++;
		}
		
		else if(objTDPlayer.day > 12 && objTDPlayer.day <= 15)
		{
			objTDPlayer.luck++;
		}
		
		instance_destroy(objMainText.daySelector);
		objGameController.statAllocationPoints = 0;
		createPlayer();
		
		currentState = CHOICESTATE.JSON;
		objMainText.currentState = MAINAREA.JSON
		
		objTDPlayer.x = 2095;
		objTDPlayer.y = 655;
		
		room_goto_next();
		
		break;
	}
	
	case CHOICESTATE.GAMESTART:
	{
		switch (currentOption)
		{
			case 0: 
			{
				currentState = CHOICESTATE.CREATION; 
				objMainText.currentState = MAINAREA.BEGINNING; 
				objGameController.gameStart = true;
				currentOption = 0; 
				break;
			}
			
			case 1: 
			{
				objTDPlayer.x = 2731;
				objTDPlayer.y = 1622;
				loadInPlayer(); 
				objGameController.characterExists = true;		
				objGameController.gameStart = true; 
 
				currentState = CHOICESTATE.JSON; 
				objMainText.currentState = MAINAREA.JSON;
				currentOption = 0; 
				break;
			}
			case 2: game_end(0);
		}
		
		break;	
	}
	
	case CHOICESTATE.JSON: //keywords or json
	{
		switch(objGameController.previousNode)
		{
			case "craftItems": craftingWeaponLogics(); break;
			
			case "sellItems": sellItemsLogic(objGameController.actionsArray); break;
			
			case "viewBounties": addQuest(objGameController.actionsArray[currentOption][? "id"]); loadFromJson(objGameController.currentNode); break;
			
			case "collectBounty": completeBounty(objGameController.actionsArray[currentOption][? "id"]); loadFromJson(objGameController.currentNode); break;
			
			default: 
			{
				objGameController.previousNode = objGameController.actionsArray[currentOption][? "target"];
				performActions(objGameController.actionsArray[currentOption][? "target"], objGameController.currentNode);	
				currentOption = 0;
			}
		}
		break;	
	}
	
	case CHOICESTATE.COMBATCHOICE:
	{
		switch (currentOption)
		{
			case 0: currentState = CHOICESTATE.ATTACK; currentOption = 0; break;
			case 1: currentState = CHOICESTATE.MAGIC; currentOption = 0; break;
			case 2: currentState = CHOICESTATE.POTION; currentOption = 0; break;
			case 3: 
			{
				currentOption = 0; 
				instance_destroy(objGameController.curEnemy); 
				objGameController.curEnemy = noone; 
				loadFromJson(objGameController.currentNode)
				break;
			}
		}
		
		break;	
	}
	
	case CHOICESTATE.ATTACK:
	{
		if(currentOption < 4)
		{
			var playerEvent =
			{
				type: "attack",
				actor: objPlayer,
				target: objGameController.curEnemy,
				attackID: objPlayer.attacks[currentOption]
			};
			ds_list_add(combatQueue, playerEvent);
			
			show_debug_message("Added playerEvent")
			
			var enemyRandomAtk = irandom(array_length(objGameController.curEnemy.attackID) -1);
			var enemyEvent =
			{
				type: "attack",
				actor: objGameController.curEnemy,
				target: objPlayer,
				attackID: objGameController.curEnemy.attackID[enemyRandomAtk]
			};
			ds_list_add(combatQueue, enemyEvent);
			
			currentState = CHOICESTATE.EVALUATECOMBAT;
		}
		
		else
		{
			currentState = CHOICESTATE.COMBATCHOICE;	
		}
		
		currentOption = 0;
		break;	
	}
	
	case CHOICESTATE.MAGIC:
	{
		if(currentOption < 4)
		{
			if(objPlayer.mana >= grabAttack(objPlayer.mAttacks[currentOption])[? "Mana"])
			{
				var playerEvent =
				{
					type: "attack",
					actor: objPlayer,
					target: objGameController.curEnemy,
					attackID: objPlayer.mAttacks[currentOption]
				};
				ds_list_add(combatQueue, playerEvent);
				objPlayer.mana -= grabAttack(objPlayer.mAttacks[currentOption])[? "Mana"]
			
				show_debug_message("Added playerEvent")
			
				var enemyRandomAtk = irandom(array_length(objGameController.curEnemy.attackID) -1);
				var enemyEvent =
				{
					type: "attack",
					actor: objGameController.curEnemy,
					target: objPlayer,
					attackID: objGameController.curEnemy.attackID[enemyRandomAtk]
				};
				ds_list_add(combatQueue, enemyEvent);
			
				currentState = CHOICESTATE.EVALUATECOMBAT;
			}
		}

		else
		{
			currentState = CHOICESTATE.COMBATCHOICE;	
		}

		currentOption = 0;
		break;	
	}

	case CHOICESTATE.POTION:
	{
		if(currentOption < 4)
		{
			if(objPlayer.potionInventory[? objPlayer.potions[currentOption]] > 0)
			{
				applyPotionEffects(objPlayer.potions[currentOption]);
				increaseInventory(objPlayer.potions[currentOption], -1);
			}
		}
		
		if(objGameController.curEnemy != noone && objGameController.curEnemy.hp > 0)
		{
			if(currentOption != 4)
			{
				rounds++;
				RoundEnd();
			}
			currentState = CHOICESTATE.COMBATCHOICE;
		}
		
		else
		{
			currentState = CHOICESTATE.JSON;	
		}
		
		currentOption = 0;
		break;
	}
}