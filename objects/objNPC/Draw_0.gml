if(currentState != NPCSTATE.IDLE && !working)
{
	draw_self();	
	
	if(currentState == NPCSTATE.TALK)
	{
		draw_sprite(sprNpcTalk, 0, x, y-10)	
	}
}

draw_text(x, y, whoAmI)

draw_circle(x, y, talkingRange, true);