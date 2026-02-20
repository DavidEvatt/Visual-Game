if(curSpot < lifeTime)
{
	curSpot++;	
}

if(curSpot >= lifeTime && holdTime > 0)
{
	holdTime--;
}

if(holdTime <= 0)
{
	instance_destroy(self)
}






