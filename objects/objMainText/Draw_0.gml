draw_set_color(c_white);
draw_set_alpha(1);
draw_self();
draw_set_font(ftMainText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Draw text inside panel bounds (adjust 50,50)
switch(currentState)
{
	case MAINAREA.GAMESTART:
	{
		 draw_text_ext(650, 85, "Welcome to the Game", 45, 780);
		 break;	
	}
	case MAINAREA.BEGINNING: 
	{
		if(!buttonsMade)
		{
			healthButton = instance_create_layer(416, 576, "Buttons", objButton);
			healthButton.modifier = "hp";
		
			strengthButton = instance_create_layer(576, 576, "Buttons", objButton);
			strengthButton.modifier = "str";
		
			dexterityButton = instance_create_layer(736, 576, "Buttons", objButton);
			dexterityButton.modifier = "dex";
		
			mindButton = instance_create_layer(896, 576, "Buttons", objButton);
			mindButton.modifier = "mind";	
			
			buttonsMade = true;
		}
		
		
		var text = "You have " + string(objGameController.statAllocationPoints) + 
		           " Points to allocate\n Health: " + string(healthButton.curentVal) +
				   "\nStrength: " + string(strengthButton.curentVal) +
				   "\nDexterity: " + string(dexterityButton.curentVal) +
				   "\nMind: " + string(mindButton.curentVal);
		
		draw_text_ext(650, 50, text, 45, 780);	
		break;	
	}
	
	case MAINAREA.NAMING:
	{
		draw_text_ext(650, 155, nameText + objChoicePanel.tempPlayerName, 45, 780);	
		break;	
	}
	
	case MAINAREA.DAYSELECT:
	{
		if(!dayButton)
		{
			objGameController.statAllocationPoints = 15;
			daySelector = instance_create_layer(640, 576, "Buttons", objButton);
			dayButton = true;
		}
		
		draw_text_ext(650, 50, "What day were you born? (1-15)", 45, 780);	
		
		break;	
	}
	
	case MAINAREA.MONTHSELECT:
	{
		draw_text_ext(650, 50, "What month were you born?\n" + 
								objChoicePanel.monthSelect[0] + " borns have more vitality\n" + 
								objChoicePanel.monthSelect[1] + " borns are stronger\n" + 
								objChoicePanel.monthSelect[2] + " borns are more agile\n" + 
								objChoicePanel.monthSelect[3] + " borns are better with magic\n" + 
								objChoicePanel.monthSelect[4] + " borns are rare and considered lucky", 45, 760);	
		break;	
	}
	
	case MAINAREA.LEVELUP: 
	{
		if(!buttonsMade)
		{
			healthButton = instance_create_layer(1024, 576, "Buttons", objButton);
			healthButton.modifier = "hp";
		
			strengthButton = instance_create_layer(1088, 576, "Buttons", objButton);
			strengthButton.modifier = "str";
		
			dexterityButton = instance_create_layer(1152, 576, "Buttons", objButton);
			dexterityButton.modifier = "dex";
		
			mindButton = instance_create_layer(1216, 576, "Buttons", objButton);
			mindButton.modifier = "mind";	
			
			buttonsMade = true;
		}
		
		
		var text = "You have " + string(objGameController.statAllocationPoints) + 
		           " Points to allocate\n Health: " + string(healthButton.curentVal) +
				   "\nStrength: " + string(strengthButton.curentVal) +
				   "\nDexterity: " + string(dexterityButton.curentVal) +
				   "\nMind: " + string(mindButton.curentVal);
		
		draw_text_ext(885, 155, text, 45, 780);	
		break;	
	}
	
	case MAINAREA.JSON: draw_text_ext(885, 65, objGameController.mainText, 45, 745); break;
	
	case MAINAREA.NEEDSPAUSE: draw_text_ext(885, 65, objGameController.mainText, 45, 745); break;

	case MAINAREA.COMBAT:
	{
		if(objPlayer.mind >= 40 && objGameController.curEnemy != noone)
		{
			draw_set_font(ftStatusMenu);
			draw_sprite(sprBarBKG, 0, 685, 405);
			draw_sprite_ext(sprHealth, 0, 688, 407, (objGameController.curEnemy.hp / objGameController.curEnemy.maxHp) * 416, 1, 0, c_white, 1);
			draw_sprite(sprBars, 0, 685, 405)
			draw_text(885, 425, "Health: " + string(objGameController.curEnemy.hp) + "/" + string(objGameController.curEnemy.maxHp));
		}
		
		draw_set_font(ftMainText);
		draw_text_ext(885, 155, combatText, 45, 800); 
		break;
	}
	
	case MAINAREA.COMBATDEATH:
	{
		draw_text_ext(885, 85, combatDeathtext, 45, 800); 
		break;
	}
}

