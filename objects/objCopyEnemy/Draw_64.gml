if(currentState != COPYENEMYSTATE.IDLE)
{
	draw_sprite(sprBarBKG, 0, 600, 10);
	draw_sprite_ext(sprHealth, 0, 600, 10, (hpDisplay / maxHp) * 416, 1, 0, c_green, 1);
	draw_sprite(sprBars, 0, 600, 10)
	draw_text(750, 15, Name + " Health: " + string(hp) + "/" + string(maxHp));
}







