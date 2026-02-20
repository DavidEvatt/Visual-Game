//keyboard checks
// Move left
if(currentState != CHOICESTATE.CREATION and currentState != CHOICESTATE.NAMING and currentState != CHOICESTATE.MONTHSELECTION and currentState != CHOICESTATE.DAYSELECTION)
{
	if (keyboard_check_pressed(vk_left)) {
	    if (currentOption mod columns != 0) {
	        currentOption -= 1;
	    }
	}

	// Move right
	if (keyboard_check_pressed(vk_right)) {
	    if (currentOption mod columns != (columns - 1) && currentOption < array_length(objGameController.actionsArray) - 1) {
	        currentOption += 1;
	    }
	}

	// Move up
	if (keyboard_check_pressed(vk_up)) {
	    if (currentOption - columns >= 0) {
	        currentOption -= columns;
	    }
	}

	// Move down
	if (keyboard_check_pressed(vk_down)) {
	    if (currentOption + columns < array_length(objGameController.actionsArray)) {
	        currentOption += columns;
	    }
	}
	
	if(namingWeapon)
	{
		tempPlayerName = keyboard_string;

	    // Optional length limit
	    if (string_length(tempPlayerName) > maxCharacters)
	    {
	        keyboard_string = string_copy(tempPlayerName, 1, maxCharacters);
	        tempPlayerName = keyboard_string;
	    }
		
		objGameController.mainText = "Name your weapon: " + tempPlayerName;
	}
}

else if(currentState == CHOICESTATE.GAMESTART)
{
	if (keyboard_check_pressed(vk_left)) {
	    if (currentOption mod columns != 0) {
	        currentOption -= 1;
	    }
	}

	// Move right
	if (keyboard_check_pressed(vk_right)) {
	    if (currentOption mod columns != (columns - 1) && currentOption < array_length(gameStart) - 1) {
	        currentOption += 1;
	    }
	}

	// Move up
	if (keyboard_check_pressed(vk_up)) {
	    if (currentOption - columns >= 0) {
	        currentOption -= columns;
	    }
	}

	// Move down
	if (keyboard_check_pressed(vk_down)) {
	    if (currentOption + columns < array_length(gameStart)) {
	        currentOption += columns;
	    }
	}
}

else if(currentState == CHOICESTATE.CREATION)
{
	objPlayer.level = 1;
	
	objPlayer.hp = 15;
	objPlayer.maxHp = objPlayer.hp;
	objPlayer.str = 10;
	objPlayer.dex = 10;
	objPlayer.mind = 10
	
	objPlayer.mana = objPlayer.mind * 5;
	objPlayer.maxMana = objPlayer.mana;
	
	objPlayer.xp = 0;
	objPlayer.xpToNext = 50;
	
	
}

else if(currentState == CHOICESTATE.NAMING)
{
	
	 // GameMaker auto-fills this string as the player types
    tempPlayerName = keyboard_string;

}

else if(currentState == CHOICESTATE.MONTHSELECTION)
{
	if (keyboard_check_pressed(vk_left)) {
	    if (currentOption mod columns != 0) {
	        currentOption -= 1;
	    }
	}

	// Move right
	if (keyboard_check_pressed(vk_right)) {
	    if (currentOption mod columns != (columns - 1) && currentOption < array_length(monthSelect) - 1) {
	        currentOption += 1;
	    }
	}

	// Move up
	if (keyboard_check_pressed(vk_up)) {
	    if (currentOption - columns >= 0) {
	        currentOption -= columns;
	    }
	}

	// Move down
	if (keyboard_check_pressed(vk_down)) {
	    if (currentOption + columns < array_length(monthSelect)) {
	        currentOption += columns;
	    }
	}
}

/*
	Add flavor Text for spells , frozen , bound and what not
*/

//Event checking
if(objGameController.curEnemy != noone && currentState == CHOICESTATE.EVALUATECOMBAT)
{
	if (ds_list_size(combatQueue) > 0) {
	    if (combatTimer <= 0) {
	        var evt = ds_list_find_value(combatQueue, 0);
			show_debug_message("This attack " + evt.attackID)

	        // Calculate damage/effects now
	        var dmgNum = 0;
	        if (evt.actor == objPlayer) {
	            if (Dodge(evt.target.dex, evt.actor.dex + hasDexiMod(evt.attackID), "PLAYER")) {
	                dmgNum = applyEffects(evt.target, evt.attackID, "PLAYER");
	            }
	        } else { // ENEMY
				 if(instance_exists(evt.target) and instance_exists(evt.actor))
				 {
		            if (Dodge(evt.actor.dex, evt.target.dex, "E")) {
		                dmgNum = applyEffects(evt.target, evt.attackID, "E");
		            }
				 }
	        }
			
			var text = "";

	        // Update combat text
			 if (evt.actor == objPlayer)
			 {
				 if(instance_exists(evt.target))
				 {
					// Status context
				    if (evt.target.frozen)
				        text += evt.target.enemyType + " is frozen.\n";
				    else if (evt.target.bound)
				        text += evt.target.enemyType + " is bound.\n";

				    // Damage result
				    if (dmgNum > 0)
				        text += evt.actor.Name + " dealt " + string(dmgNum) + " damage!";
				    else
				        text += evt.actor.Name + " missed!";
				 }
			 }
			 
			 else if(instance_exists(evt.actor))
			 {
				 if(evt.actor.hp > 0)
				 {
					 // Status prevents action
				    if (evt.actor.frozen)
				    {
				        text += evt.actor.enemyType + " is frozen and cannot move!";
				    }
				    else if (evt.actor.bound)
				    {
				        text += evt.actor.enemyType + " struggles against its bindings!";
				    }
				    else
				    {
				        // Normal enemy attack
				        if (dmgNum > 0)
				            text += evt.actor.enemyType + " dealt " + string(dmgNum) + " damage!";
				        else
				            text += evt.actor.enemyType + " missed!";
				    }
				 }
			 }
			 
			 objMainText.combatText = text;

	        // Remove processed event
	        ds_list_delete(combatQueue, 0);

	        // Reset timer for next event
	        combatTimer = combatDelay;
	    } else {
	        combatTimer -= 1; // countdown frames until next event
	    }
	} else 
	{
		if(combatTimer > 0){combatTimer--}
		else
		{
			objMainText.combatText = "You are fighting a " + objGameController.curEnemy.enemyType;
			rounds++;
			RoundEnd();
			currentState = CHOICESTATE.COMBATCHOICE;
		}
	}
}

if(currentState == CHOICESTATE.COMBATCHOICE && objGameController.curEnemy == noone)
{
	currentState = CHOICESTATE.JSON;	
}