if(other.enemyType == "Copy")
{
	other.currentState = COPYENEMYSTATE.HIT;
}
		
else {other.currentState = ENEMYSTATE.HIT;}

other.curHitStun = other.maxHitStun;
other.updated = true;
other.atkCooldown = other.maxAtkCD
other.curCharge = 0;
other.canCharge = true

applyEffects(other, objTDPlayer.weapon, "P")
EnemyDeath(other);


instance_destroy(self)