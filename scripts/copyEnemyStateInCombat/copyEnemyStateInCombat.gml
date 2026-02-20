// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function copyEnemyStateInCombat()
{
	var dir = point_direction(x, y, objTDPlayer.x, objTDPlayer.y)
	var hasLOS = lineOfSight();
	
	//check if I can and need to dodge
	if(objTDPlayer.currentState == PLAYERSTATE.ATTACK || objTDPlayer.currentState == PLAYERSTATE.COMBO)
	{
		if(curDodgeCD <= 0 && place_meeting(x, y, objTDPlayer))
		{
			dodgeTimer = dodgeCooldown
			needsDodge = true;
			currentState = COPYENEMYSTATE.DODGE
		}
	}
	
	//check if I need to run
	if(hp <= maxHp * 0.25) // <= to 25% hp
	{		
		if(distance_to_object(objTDPlayer) >= healDistance) 
		{
			//if we are far enough away then heal
			currentState = COPYENEMYSTATE.HEAL;	
		}
		
		else
		{
			//other wise run until you can
			currentState = COPYENEMYSTATE.RUN;	
		}
	}

	//movement towards player
	if(distance_to_object(objTDPlayer) <= detectionRange && hasLOS)
	{
		giveUpCounter = 0
		hsp = lengthdir_x(moveSpd, dir);
		vsp = lengthdir_y(moveSpd, dir);
		targX = objTDPlayer.x;
		targY = objTDPlayer.y
		hadLos = true
	}
	
	//attempting to hit player
	if(distance_to_object(objTDPlayer) <= attackRange && hasLOS && atkCooldown <= 0)
	{
		targX = objTDPlayer.x;
	    targY = objTDPlayer.y;
		currentState = COPYENEMYSTATE.ATTACK
	}
	
	//look for player if I cant see them
	if(!hasLOS && hadLos)
	{
		 // FIRST frame LOS is lost
	    targX = objTDPlayer.x;
	    targY = objTDPlayer.y;
		hadLos = hasLOS;
	}

	//enemy has lost the player so create a temp patrol spot
	if(x == targX && y = targY && !hasLOS)
	{
		hsp = 0;
		vsp = 0;
		tempHomeX = x;
		tempHomeY = y;
		holdTempLocationTimer = tempLocationTimer
		movingToSpot = false;
		currentState = COPYENEMYSTATE.IDLE
	}

	//moving towards last know spot
	else if (!hasLOS) 
	{
		dir = point_direction(x, y, targX,targY);
		hsp = lengthdir_x(moveSpd, dir);
		vsp = lengthdir_y(moveSpd, dir);
	}

	//start the give up counter
	if(distance_to_object(objTDPlayer) >= detectionRange && giveUpCounter < 180)
	{
		giveUpCounter++;
	}
	
	//Starts the give up logic
	else if(giveUpCounter >= 180)
	{
		hsp = 0;
		vsp = 0;
		tempHomeX = x;
		tempHomeY = y;
		movingToSpot = false;
		holdTempLocationTimer = tempLocationTimer
		currentState = COPYENEMYSTATE.IDLE
		
	}
	
	/*
	#region Player Collsion
	
		var dx = attackRange + 3;
		var dy = attackRange + 3;
		
		if(hsp >= 0){dx *= 1} else{dx *= -1}		
		if(vsp >= 0){dy *= 1} else{dy *= -1}

	
		if (place_meeting(x + dx, y, objTDPlayer)) 
		{
			if (path_index != -1) path_end();
		    hsp = 0; // Stop movement when touching a wall
		} 
    
	// Vertical Movement (Floor Collision)
		if (place_meeting(x, y + dy, objTDPlayer)) 
		{
			if (path_index != -1) path_end();
		    vsp = 0; // Stop falling
		} 
		
	#endregion*/
	
	with(self)
	{
		var path = path_add();
		if(mp_grid_path(objGameController.worldMap, path, x, y, targX, targY, true))
		{
			path_start(path, moveSpd, path_action_stop, 0)	
		}
	}
}