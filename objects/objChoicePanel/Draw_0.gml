draw_self();
draw_set_font(ftChoicesText);
draw_set_halign(fa_left);
draw_set_alpha(1);

switch(currentState)
{
	
	case CHOICESTATE.GAMESTART:
	{	
		columns = drawingOptionGird(gameStart, 535, 525, 35, 3, currentOption, 20, "general");
	
		break;	
	}
	
	case CHOICESTATE.MONTHSELECTION:
	{
		columns = drawingOptionGird(monthSelect, 335, 525, 35, 3, currentOption, 20, "general");
		
		break;	
	}
	
	case CHOICESTATE.JSON:
	{
		if (string_pos(".json", objGameController.previousNode) > 0)
		{
			columns = drawingOptionGird(objGameController.actionsArray, 535, 525, 35, 2, currentOption, 20, "json");
		}
		
		else if(objGameController.previousNode == "buyItems" || objGameController.previousNode == "openShop")
		{
			draw_set_font(ftInventory)
			columns = drawingOptionGird(objGameController.actionsArray, 535, 525, 35, 2, currentOption, 20, "json");
		}
		
		else if(objGameController.previousNode == "viewBounties" || objGameController.previousNode == "collectBounty")
		{
			draw_set_font(ftStatusMenu)
			columns = drawingOptionGird(objGameController.actionsArray, 535, 525, 35, 4, currentOption, 20, "bounties");
		}
		
		else if(!timeToBuy || objGameController.previousNode == "sellItems")
		{
			draw_set_font(ftStatusMenu)
			columns = drawingOptionGird(objGameController.actionsArray, 535, 525, 35, 4, currentOption, 20, "material");
		}
		
		
		else
		{
			draw_set_font(ftChoicesText)
			columns = drawingOptionGird(objGameController.actionsArray, 535, 525, 35, 3, currentOption, 20, "general");
		}
		
		break;
	}
	
	case CHOICESTATE.COMBATCHOICE:
	{
		var yStart = 535;
		var xStart = 525;
		var lineHeight = 35;

		var xVal = xStart;
		var yVal = yStart;

		//setting up columns

		columns = 2

		var colWidth[];
		for(var c = 0; c < columns; c++)
		{
			colWidth[c] = 0; //sets them all to 0	
		}

		// Calculate column widths
		for (var i = 0; i < array_length(combatChoices); i++) 
		{
		    var col = i mod columns;
		    var text = "[" + string(i + 1) + "] " + combatChoices[i];
		    var textWidth = string_width(text);
		    if (textWidth > colWidth[col]) 
			{
		        colWidth[col] = textWidth;
		    }
		}

		//print the actions
		for (var i = 0; i < array_length(combatChoices); i++) 
		{
			xVal = xStart;
			var text = "[" + string(i + 1) + "] " + combatChoices[i];
			var col = i mod columns;
		    var row = floor(i / columns)
	
			// Compute x position for this column
		    for (var c = 0; c < col; c++) 
			{
		        xVal += colWidth[c] + 20; // add spacing between columns
		    }

		    // Compute y position
		    yVal = yStart + row * lineHeight;
	
			if(i == currentOption)
			{
				draw_set_color(c_lime);
			}
	
			else
			{
				draw_set_color(c_white);	
			}
		
	
			draw_text(xVal, yVal, text);
		}
		
		break;
	}
	
	case CHOICESTATE.ATTACK:
	{
		var actions = objPlayer.attacks
		var yStart = 535;
		var xStart = 525;
		var lineHeight = 35;

		var xVal = xStart;
		var yVal = yStart;

		//setting up columns

		columns = 2
		var colWidth[];
		for(var c = 0; c < columns; c++)
		{
			colWidth[c] = 0; //sets them all to 0	
		}

		// Calculate column widths
		for (var i = 0; i < array_length(actions); i++) 
		{
		    var col = i mod columns;
			var atk = grabAttack(actions[i])
		    var text = "[" + string(i + 1) + "] " + atk[? "Name"];
		    var textWidth = string_width(text);
		    if (textWidth > colWidth[col]) 
			{
		        colWidth[col] = textWidth;
		    }
		}

		//print the actions
		for (var i = 0; i < array_length(actions) + 1; i++) 
		{
			xVal = xStart;
			var text =  "";
			
			if(i == array_length(actions))
			{
				text = "[5] Back";
			}
			
			else 
			{
				var atk = grabAttack(actions[i])
				text = "[" + string(i + 1) + "] " + atk[? "Name"];	
			}
			var col = i mod columns;
		    var row = floor(i / columns)
	
			// Compute x position for this column
		    for (var c = 0; c < col; c++) 
			{
		        xVal += colWidth[c] + 20; // add spacing between columns
		    }

		    // Compute y position
		    yVal = yStart + row * lineHeight;
	
			if(i == currentOption)
			{
				if(i < 4)
				{
					draw_set_font(ftStatusMenu);
					draw_set_color(c_grey);
					draw_set_alpha(0.4);
					draw_rectangle(xStart + 350, yStart + 100, 1235, 700, false);
					draw_set_alpha(1)
					draw_set_color(c_black)
					draw_rectangle(xStart + 349, yStart + 99, 1236, 701, true);				
					draw_rectangle(xStart + 348, yStart + 98, 1237, 702, true);
				
					draw_set_color(c_white);
					var atkText = determineEffects(objPlayer.attacks[currentOption], objGameController.curEnemy);
				
					draw_text_ext(xStart + 360, yStart + 120, atkText,1, 200);
				}
				draw_set_font(ftChoicesText);

				draw_set_color(c_lime);
			}
	
			else
			{
				draw_set_color(c_white);	
			}
		
	
			draw_text(xVal, yVal, text);
		}
		
		break;
	}
	
	case CHOICESTATE.MAGIC:
	{
		var actions = objPlayer.mAttacks
		var yStart = 535;
		var xStart = 525;
		var lineHeight = 35;

		var xVal = xStart;
		var yVal = yStart;

		//setting up columns
		columns = 2

		var colWidth[];
		for(var c = 0; c < columns; c++)
		{
			colWidth[c] = 0; //sets them all to 0	
		}

		// Calculate column widths
		for (var i = 0; i < array_length(actions); i++) 
		{
		    var col = i mod columns;
			var atk = grabAttack(actions[i])
		    var text = "[" + string(i + 1) + "] " + atk[? "Name"];
		    var textWidth = string_width(text);
		    if (textWidth > colWidth[col]) 
			{
		        colWidth[col] = textWidth;
		    }
		}
		
		

		//print the actions
		for (var i = 0; i <= array_length(actions); i++) 
		{
			xVal = xStart;
			var text =  "";
			
			if(i == array_length(actions))
			{
				text = "[5] Back";
			}
			
			else 
			{
				var atk = grabAttack(actions[i])
				text = "[" + string(i + 1) + "] " + atk[? "Name"];	
			}
			var col = i mod columns;
		    var row = floor(i / columns)
	
			// Compute x position for this column
		    for (var c = 0; c < col; c++) 
			{
		        xVal += colWidth[c] + 20; // add spacing between columns
		    }

		    // Compute y position
		    yVal = yStart + row * lineHeight;
	
			if(i == currentOption)
			{
				if(i < 4)
				{
					draw_set_font(ftStatusMenu);
					draw_set_color(c_grey);
					draw_set_alpha(0.4);
					draw_rectangle(xStart + 350, yStart + 100, 1235, 700, false);
					draw_set_alpha(1)
					draw_set_color(c_black)
					draw_rectangle(xStart + 349, yStart + 99, 1236, 701, true);				
					draw_rectangle(xStart + 348, yStart + 98, 1237, 702, true);
					
					var barWidth = (objPlayer.manaDisplay / objPlayer.maxMana) * 416;
					var atk = grabAttack(objPlayer.mAttacks[currentOption]);
					draw_sprite_ext(sprHealth, 0, 43 + (barWidth), 98, (atk[? "Mana"] / objPlayer.maxMana) * -416, 1, 0, c_maroon, 1);
				
					draw_set_color(c_white);
					var atkText = determineEffects(objPlayer.mAttacks[currentOption], objGameController.curEnemy);
				
					draw_text_ext(xStart + 360, yStart + 120, atkText,1, 600);
				}
				draw_set_font(ftChoicesText);
				
				draw_set_color(c_lime);
			}
	
			else
			{
				draw_set_color(c_white);	
			}
		
	
			draw_text(xVal, yVal, text);
		}
		
		break;
	}

	case CHOICESTATE.POTION:
	{
		var actions = objPlayer.potions
		var yStart = 535;
		var xStart = 525;
		var lineHeight = 35;
		var text = "";

		var xVal = xStart;
		var yVal = yStart;

		//setting up columns

		columns = 2

		var colWidth[];
		for(var c = 0; c < columns; c++)
		{
			colWidth[c] = 0; //sets them all to 0	
		}

		// Calculate column widths
		for (var i = 0; i < array_length(actions); i++) 
		{
		    var col = i mod columns;
			var atk = grabPotion(actions[i])
			if (!is_undefined(atk))
			{
				text = "[" + string(i + 1) + "] " + atk[? "Name"];
			}
			
			else
			{
				show_debug_message("Its undefined")
			}
			
		    var textWidth = string_width(text);
		    if (textWidth > colWidth[col]) 
			{
		        colWidth[col] = textWidth;
		    }
		}

		//print the actions
		for (var i = 0; i <= array_length(actions); i++) 
		{
			xVal = xStart;
			text =  "";
			
			if(i == array_length(actions))
			{
				text = "[5] Back";
			}
			
			else 
			{
				var atk = grabPotion(actions[i])
				if (!is_undefined(atk))
				{
					text = "[" + string(i + 1) + "] " + atk[? "Name"];
				}
			
				else
				{
					show_debug_message("Its undefined")
				}
			
				text = "[" + string(i + 1) + "] " + atk[? "Name"];	
			}
			var col = i mod columns;
		    var row = floor(i / columns)
	
			// Compute x position for this column
		    for (var c = 0; c < col; c++) 
			{
		        xVal += colWidth[c] + 20; // add spacing between columns
		    }

		    // Compute y position
		    yVal = yStart + row * lineHeight;
	
			if(i == currentOption)
			{
				if(i < 4)
				{
					draw_set_font(ftStatusMenu);
					draw_set_color(c_grey);
					draw_set_alpha(0.4);
					draw_rectangle(xStart + 350, yStart + 100, 1235, 700, false);
					draw_set_alpha(1)
					draw_set_color(c_black)
					draw_rectangle(xStart + 349, yStart + 99, 1236, 701, true);				
					draw_rectangle(xStart + 348, yStart + 98, 1237, 702, true);
				
					draw_set_color(c_white);
					var atkText = determinePotionEffects(objPlayer.potions[currentOption])
				
					draw_text_ext(xStart + 360, yStart + 120, atkText,1, 600);
				}
				draw_set_font(ftChoicesText);
				
				draw_set_color(c_lime);
			}
	
			else
			{
				draw_set_color(c_white);	
			}
		
	
			draw_text(xVal, yVal, text);
		}
		
		break;
	}
}
