if(curHitStun <= 0)
{
	colorMyself
	(
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

else
{
	shader_set(hitStun);
	draw_self();
	shader_reset();
}









