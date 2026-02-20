// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyStateIdle()
{
	if(distance_to_object(objTDPlayer) <= detectionRange && lineOfSight())
	{
		if(enemyType == "Rabbit" || enemyType == "Squirrel")
		{
			currentState = ENEMYSTATE.RUN
			movingToSpot = false;
		}
		
		else
		{
			currentState = ENEMYSTATE.PURSUE;
			movingToSpot = false;
		}
	}
	
	if(tempHomeX != undefined && tempHomeY != undefined)
	{
		var dist = point_distance(x, y, newX, newY);
		if(dist <= moveSpd && movingToSpot)
		{
			hsp = 0;
			vsp = 0;
			holdNewSpotTimer = newSpotTimer;
			movingToSpot = false;
		}
		
		//check if we have been at our spot long enough
		if(holdNewSpotTimer <= 0 && !movingToSpot)
		{
			//Check the direcction
			var northSouth = irandom(2);
			var eastWest = irandom(2);
			
			if(northSouth == 0) //south +y
			{
				newY = irandom(moveRange48 * 48) + tempHomeY;
				//show_debug_message("Moving South : Y = " + string(newY) + " | From : Y = " + string(homeY));
			}
			
			else if(northSouth == 1) //north -y
			{
				newY = tempHomeY - irandom(moveRange48 * 48);
				//show_debug_message("Moving North : Y = " + string(newY) + " | From : Y = " + string(homeY));
			}
			
			else if(northSouth == 2) //nothing
			{
				//show_debug_message("Nothing Done")
				newY = y;
			}
			
			if(eastWest == 0) //east +x
			{
				image_xscale = -1
				newX = tempHomeX + irandom(moveRange48 * 48);
				//show_debug_message("Moving East : X = " + string(newX) + " | From : X = " + string(homeX));
			}
			
			else if(eastWest == 1) //west -x
			{
				
				newX = tempHomeX - irandom(moveRange48 * 48);
				//show_debug_message("Moving West : X = " + string(newX) + " | From : X = " + string(homeX));
			}
			
			else if(eastWest == 2) //nothing
			{
				//show_debug_message("Doing Nothing");
				
				newX = x;
			}
			
			//see if there is a wall at that new spot
			if(!place_meeting(newX, newY, objWall))
			{
				var dir = point_direction(x, y, newX, newY)
				hsp = lengthdir_x(moveSpd, dir);
				vsp = lengthdir_y(moveSpd, dir);
			}
			
			else
			{
				newX = x;
				newY = y;
			}
			
			movingToSpot = true;
		}
		
		if(holdNewSpotTimer > 0)
		{
			hsp = 0;
			vsp = 0;
		}
		
		if(x > newX)
		{
			image_xscale = 1;
		}
		
		else{image_xscale = -1}
	}
	
	else
	{
		var dist = point_distance(x, y, newX, newY);
		if(dist <= moveSpd && movingToSpot)
		{
			hsp = 0;
			vsp = 0;
			holdNewSpotTimer = newSpotTimer;
			movingToSpot = false;
		}
		
		//check if we have been at our spot long enough
		if(holdNewSpotTimer <= 0 && !movingToSpot)
		{
			//Check the direcction
			var northSouth = irandom(2);
			var eastWest = irandom(2);
			
			//show_debug_message("X range = " + string(homeX - (moveRange48 * 48)) + " to " + string(homeX + (moveRange48 * 48)))
			
			if(northSouth == 0) //south +y
			{
				newY = irandom(moveRange48 * 48) + homeY;
				//show_debug_message("Moving South : Y = " + string(newY) + " | From : Y = " + string(homeY));
			}
			
			else if(northSouth == 1) //north -y
			{
				newY = homeY - irandom(moveRange48 * 48);
				//show_debug_message("Moving North : Y = " + string(newY) + " | From : Y = " + string(homeY));
			}
			
			else if(northSouth == 2) //nothing
			{
				//show_debug_message("Nothing Done")
				newY = y;
			}
			
			if(eastWest == 0) //east +x
			{
				image_xscale = -1
				newX = homeX + irandom(moveRange48 * 48);
				//show_debug_message("Moving East : X = " + string(newX) + " | From : X = " + string(homeX));
			}
			
			else if(eastWest == 1) //west -x
			{
				
				newX = homeX - irandom(moveRange48 * 48);
				//show_debug_message("Moving West : X = " + string(newX) + " | From : X = " + string(homeX));
			}
			
			else if(eastWest == 2) //nothing
			{
				//show_debug_message("Doing Nothing");
				
				newX = x;
			}
			
			movingToSpot = true;
		}
		
		if(holdNewSpotTimer > 0)
		{
			hsp = 0;
			vsp = 0;
		}
		
		if(x > newX)
		{
			image_xscale = 1;
		}
		
		else{image_xscale = -1}
	}
	
	with(self)
	{
		var path = path_add();
		if(mp_grid_path(objGameController.worldMap, path, x, y, newX, newY, true))
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
			
				if(movingToSpot)
				{
					newX = x;	
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
				
				if(movingToSpot)
				{
					newY = y;	
				}
			    vsp = 0; // Stop falling
			} 
    
			else y = lerp(y, y + vsp, 1); // Move normally in the air
		#endregion*/
}