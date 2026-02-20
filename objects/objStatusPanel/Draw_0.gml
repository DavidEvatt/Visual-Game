draw_set_color(c_white);
draw_set_alpha(1);
draw_set_valign(fa_middle)
draw_set_font(ftStatusMenu)
draw_self();

if(mouse_x >= 38 and mouse_x <= 198)
{	
	if(mouse_y >= 30 and mouse_y <= 48)
	{
		draw_set_color(c_yellow);	
	}
}

else
{
	draw_set_color(c_white);	
}

draw_set_color(c_white);

switch(currentState)
{
	case STATUSSTATE.BARS:
	{	
		break;
	}

	case STATUSSTATE.STATS:
	{
		draw_set_color(c_white);
		draw_text_ext(40, 105,   "Dexterity : " + string(objPlayer.dex) +
							   "\nStrength   : " + string(objPlayer.str) +
							   "\nMind        : " + string(objPlayer.mind) +
							   "\nLuck         : " + string(objPlayer.luck), 25, 280);
		
		break;
	}
	
	case STATUSSTATE.BIRTHDAY:
	{
		draw_text_ext(40, 75, "Born on " + objPlayer.month + ", " +
							   string(objPlayer.day) + " during the " +
							   objPlayer.time + "\nCoins: " + string(objPlayer.coins), 25, 400);
		
		//reputation bar
		var curRep = objGameController.curRegion.reputation;
		var barWidth = 416;
		
		if(curRep >= 0)
		{
			var amount = min(curRep / objGameController.curRegion.maxReputation, 1);
			draw_sprite(sprBarBKGXp, 0, 40, 138);
			draw_sprite_ext(sprXP, 0, (barWidth/2) + 43, 140, amount * (barWidth /2), 1, 0, colorGoodRep, 1);
			draw_sprite(sprBarsXP, 0, 40, 138);
		}
		
		else
		{
			var amount = min(curRep / objGameController.curRegion.minReputation, 1);
			
			draw_sprite(sprBarBKGXp, 0, 40, 138);
			draw_sprite_ext(sprXP, 0, (barWidth/2) + 43, 140, amount * -(barWidth /2), 1, 0, colorBadRep, 1);
			draw_sprite(sprBarsXP, 0, 40, 138);
		}
		
		draw_text(190, 150, "Reputation");
				   
		
		break;
	}
}
