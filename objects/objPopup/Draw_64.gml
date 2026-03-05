
if(currentState == POPSTATE.VISIBLE)
{
	image_alpha = alphaVal;
	draw_self();
	
	draw_set_font(ftChoicesText)
	draw_text_ext_color(xPos, yPos, popText, 20, 450, c_yellow, c_yellow, c_yellow, c_yellow, alphaVal);
}

draw_set_font(ftInteract);











