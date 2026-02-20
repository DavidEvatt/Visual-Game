draw_set_alpha(1);
draw_set_color(c_white)

if(currentState == ENEMYSTATE.HIT && curHitStun > 0)
{
	shader_set(hitStun);
	draw_self()
	shader_reset();
}

else{draw_self();}

/*
switch(currentState)
{
	case ENEMYSTATE.IDLE: draw_circle_color(x, y, 20, c_green, c_green, false); break;	
	case ENEMYSTATE.PURSUE: draw_circle_color(x, y, 20, c_red, c_red, false) break;
}

//Developer testing zones
draw_set_color(c_blue);
draw_circle(x, y, detectionRange, true);
draw_set_color(c_red);
draw_circle(x, y, attackRange, true)
draw_set_color(c_white);

/*
if(hadLos)
{
	draw_set_color(c_green);	
}

else {draw_set_color(c_red)}

draw_line(x, y, objTDPlayer.x, objTDPlayer.y);

draw_set_color(c_red)
draw_rectangle(homeX - (moveRange48 * 48), homeY -(moveRange48 * 48), homeX + (moveRange48 * 48), homeY + (moveRange48 * 48), true)

if(tempHomeX != undefined && tempHomeY != undefined)
{
	draw_rectangle(tempHomeX - (moveRange48 * 48), tempHomeY -(moveRange48 * 48), tempHomeX + (moveRange48 * 48), tempHomeY + (moveRange48 * 48), true)
}*/

