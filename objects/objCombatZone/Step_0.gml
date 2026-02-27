collision_circle_list(x, y, collisionRadius, objEnemy, false, true, enemiesInside, true);

if(!ds_list_empty(enemiesInside))
{
	enemiesAlive = true
}

else{enemiesAlive = false}

if(allowRespawns)
{
	if(ds_list_size(enemiesInside) < maxEnemiesInside && respawnTimer <= 0)
	{
		var randomEny = irandom_range(0, 2);
	
		switch(randomEny)
		{
			case 0:
			{
				if(spawnEnemy1 != noone)
				{
					instance_create_layer(x, y, "combatEncounters", spawnEnemy1); 
					respawnTimer = maxRespawnTime
				}
				
				break;
			}
			
			case 1: 
			{
				if(spawnEnemy2 != noone)
				{
					instance_create_layer(x, y, "combatEncounters", spawnEnemy2); 
					respawnTimer = maxRespawnTime
				}
				break;
			}
			
			case 2: 
			{
				if(spawnEnemy3 != noone)
				{
					instance_create_layer(x, y, "combatEncounters", spawnEnemy3); 
					respawnTimer = maxRespawnTime
				}
				break;
			}
		}
	}	
}

ds_list_clear(enemiesInside);


if(respawnTimer > 0) {respawnTimer--;}