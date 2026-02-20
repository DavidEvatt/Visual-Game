draw_set_alpha(1);
draw_set_color(c_white)

if(currentState == COPYENEMYSTATE.HIT && curHitStun > 0)
{
	show_debug_message("Runnign hit shader")
	shader_set(hitStun);
	draw_self()
	shader_reset();
}

else
{
	colorMyself(
		self,
		playerColors[0],
		playerColors[1],
		playerColors[2],
		playerColors[3],
		playerColors[4],
		playerColors[5],
		weaponColor[0],
		weaponColor[1],
		weaponColor[2],
		weaponColor[3]
	);
	
	draw_self();
	shader_reset();
}

/*
switch(currentState)
{
	case COPYENEMYSTATE.IDLE: draw_circle_color(x, y, 20, c_green, c_green, false); break;
	case COPYENEMYSTATE.INCOMBAT: draw_circle_color(x, y, 20, c_red, c_red, false); break;
	case COPYENEMYSTATE.DODGE: draw_circle_color(x, y, 20, c_blue, c_blue, false); break;
	case COPYENEMYSTATE.RUN: draw_circle_color(x, y, 20, c_yellow, c_yellow, false); break;
	case COPYENEMYSTATE.HEAL: draw_circle_color(x, y, 20, c_lime, c_lime, false); break;
	case COPYENEMYSTATE.ATTACK: draw_circle_color(x, y, 20, c_maroon, c_maroon, false); break;
}*/
/*
//Developer testing zones
draw_set_color(c_blue);
draw_circle(x, y, detectionRange, true);
draw_set_color(c_red);
draw_circle(x, y, attackRange, true)
draw_set_color(c_yellow);
draw_circle(x, y, healDistance, true)
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
}
*/








