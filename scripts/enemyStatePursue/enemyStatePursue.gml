// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyStatePursue()
{
	
	var dir = point_direction(x, y, objTDPlayer.x, objTDPlayer.y)
	var hasLOS = lineOfSight();

	if(distance_to_object(objTDPlayer) <= detectionRange && hasLOS)
	{
		giveUpCounter = 0
		targX = objTDPlayer.x;
	    targY = objTDPlayer.y;
		hadLos = true
	}
	
	if(distance_to_object(objTDPlayer) <= attackRange && hasLOS && atkCooldown <= 0)
	{
		targX = objTDPlayer.x;
	    targY = objTDPlayer.y;
		currentState = ENEMYSTATE.ATTACK
	}

	if(!hasLOS && hadLos)
	{
		 // FIRST frame LOS is lost
	    targX = objTDPlayer.x;
	    targY = objTDPlayer.y;
		hadLos = hasLOS;
	}

	if(x == targX && y = targY && !hasLOS)
	{
		hsp = 0;
		vsp = 0;
		tempHomeX = x;
		tempHomeY = y;
		holdTempLocationTimer = tempLocationTimer
		movingToSpot = false;
		currentState = ENEMYSTATE.IDLE
		path_end();
	}

	else if(!hasLOS) 
	{
		dir = point_direction(x, y, targX,targY);
		hsp = lengthdir_x(moveSpd, dir);
		vsp = lengthdir_y(moveSpd, dir);
	}


	if(distance_to_object(objTDPlayer) >= detectionRange && giveUpCounter < 180)
	{
		giveUpCounter++;
	}

	else if(giveUpCounter >= 180)
	{
		hsp = 0;
		vsp = 0;
		tempHomeX = x;
		tempHomeY = y;
		movingToSpot = false;
		holdTempLocationTimer = tempLocationTimer
		currentState = ENEMYSTATE.IDLE
		path_end();
		
	}
	
	with(self)
	{
		var path = path_add();
		if(mp_grid_path(objGameController.worldMap, path, x, y, targX, targY, true))
		{
			path_start(path, moveSpd, path_action_stop, 0)	
		}
	}
	
	/*
	#region Movement Collisions
	//horizontal movment
		if (place_meeting(x + hsp, y, objWall)) 
		{
		    while (!place_meeting(x + sign(hsp), y, objWall)) 
		    {
		        x += sign(hsp); // Move pixel by pixel until the wall
		    }
        
		    hsp = 0; // Stop movement when touching a wall
		} 
			
    
		else x = lerp(x, x + hsp, 1); // Move normally
    
	// Vertical Movement (Floor Collision)
		if (place_meeting(x, y + vsp, objWall)) 
		{
		    while (!place_meeting(x, y + sign(vsp), objWall)) 
		    {
		        y += sign(vsp); // Move down pixel by pixel until flush with the floor
		    }
		    vsp = 0; // Stop falling
		} 
    
		else y = lerp(y, y + vsp, 1); // Move normally in the air
	#endregion*/
}