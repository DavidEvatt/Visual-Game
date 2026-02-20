if(needsDir)
{
	dir = point_direction(x, y, targX, targY);
	needsDir = false
}


if(lifeTime > 0)
{
	lifeTime--;
	hsp += lengthdir_x(spd, dir)
	vsp += lengthdir_y(spd, dir)

}

else 
{
	instance_destroy(self)
	hsp = 0;
	vsp = 0;
}


x += hsp;
y += vsp;

