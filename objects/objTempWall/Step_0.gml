if(!is_undefined(nearestCombat) && nearestCombat != noone)
{
	if(nearestCombat.collisionOnPlayer)
	{
		if(nearestCombat.enemiesAlive)
		{
			open = true;
		}
	
		if(open && !nearestCombat.enemiesAlive)
		{
			open = false;	
		}
	}
}

else
{
	nearestCombat = instance_nearest(x, y, objCombatZone)	
}

if(open && !endOfAni)
{
	image_speed = 1;
}

else if(!open && endOfAni)
{
	image_speed = -1;	
}