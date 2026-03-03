draw_set_alpha(1);
switch(currentState)
{
	case CHOICESTATE.NPCTALK:
	{
		draw_set_halign(fa_center);
		draw_sprite(sprChoices, 0, 250, 475)
		
		draw_set_font(ftStatusMenu)
		
		columns = drawingOptionGird(objGameController.actionsArray, (sprChoices.sprite_width / 2) + 200, 600, 35, 4, currentOption, 20, "json");
		
		draw_set_colour(c_white);
		var _text_to_draw = string_copy(mainMessage, 1, floor(charCount));
		draw_text((sprChoices.sprite_width / 2) + 250, 525, _text_to_draw);
		
		break;
	}
}