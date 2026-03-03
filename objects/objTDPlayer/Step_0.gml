if(room != Room1)
{
	keyRight = keyboard_check(ord("D"));
	keyLeft = keyboard_check(ord("A"));
	keyUp = keyboard_check(ord("W"));
	keyDown = keyboard_check(ord("S"));
	keyAttack = mouse_check_button_pressed(mb_left);
	keySpace = keyboard_check_pressed(vk_space)
	
	if(hpDisplay != hp)
	{
		hpDisplay = lerp(hpDisplay, hp, varDisplaySpd);

		// Snap to actual hp when close
		if (abs(hpDisplay - hp) < 0.1) hpDisplay = hp;
	}


	if(manaDisplay != mana)
	{
		manaDisplay = lerp(manaDisplay, mana, varDisplaySpd);

		// Snap to actual hp when close
		if (abs(manaDisplay - mana) < 0.1) manaDisplay = mana;
	}

	if(xpDisplay != xp)
	{
		xpDisplay = lerp(xpDisplay, xp, varDisplaySpd);

		// Snap to actual hp when close
		if (abs(xpDisplay - xp) < 0.1) xpDisplay = xp;
	}
	
	switch(currentState)
	{
		case PLAYERSTATE.MOVE: playerStateFree(); break;	
		case PLAYERSTATE.ATTACK: playerStateAttack(); break;
		case PLAYERSTATE.COMBO: playerStateCombo(); break;

	}

	if(curatkCooldown > 0)
	{
		curatkCooldown--;	
	}

	if(comboBuffer > 0)
	{
		comboBuffer--;	
	}

	if(curHitStun > 0)
	{
		curHitStun --;	
	}

	if(iframes > 0)
	{
		iframes--;	
	}
	
	if(mana < maxMana)
	{
		mana += manaRegen;	
	}
	
	if(talkingToNpc)
	{
		var npc = instance_nearest(x,y ,objNPC);
		
		if(distance_to_object(npc) >= talkingRange)
		{
			if(npc.currentState == NPCSTATE.TALKTOPLAYER)
			{
				npc.path_speed = npc.pathSpd;
				talkingToNpc = false;	
				npc.currentState = NPCSTATE.MOVE;
				objChoicePanel.currentState = CHOICESTATE.JSON;
				objChoicePanel.charCount = 0;
			}	
		}
	}
}







