// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyHit(target)
{
	audio_play_sound(hitSound, 1, false)
	var dir = point_direction(objTDPlayer.x, objTDPlayer.y, target.x, target.y);
	part_type_direction(particleManager._ptype1Hit, dir - 20, dir + 20, 0, 0);
	
	if(crit)
	{
		part_type_colour3(particleManager._ptype1Hit, c_yellow, c_yellow, c_yellow);
	}
	
	else
	{
		part_type_colour3(particleManager._ptype1Hit, c_white, c_white, c_white);
	}
	
	part_particles_create(particleManager._psHit, target.x, target.y, particleManager._ptype1Hit, 1)
	if(currentState == PLAYERSTATE.COMBO)
	{
		target.knockback = self.comboknockBackDis
		target.curHitStun = target.maxHitStun;
		if(target.enemyType == "Copy")
		{
			target.currentState = COPYENEMYSTATE.HIT;
		}
		
		else {target.currentState = ENEMYSTATE.HIT;}
	}
	
	else
	{
		target.knockback = self.knockBackDis
		target.curHitStun = target.maxHitStun;
		if(target.enemyType == "Copy")
		{
			target.currentState = COPYENEMYSTATE.HIT;
		}
		
		else {target.currentState = ENEMYSTATE.HIT;}
	}
	
	target.updated = true;
	target.atkCooldown = target.maxAtkCD
	target.curCharge = 0;
	target.canCharge = true
	
	crit = false;
}