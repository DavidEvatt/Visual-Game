// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function npcStateDistracted()
{
	if(tempHomeX != undefined && tempHomeY != undefined)
	{	
		//show_debug_message("Temp Home variables are existing")
		//show_debug_message("HoldNewSpot: " + string(holdNewSpotTimer) + " | MovingSpot: " + string(movingToSpot))
		//check if we have been at our spot long enough
		if(holdNewSpotTimer <= 0 && !movingToSpot)
		{
			//show_debug_message("holdSpot should be less than 0 and we are not movingSpot")
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
			
			//show_debug_message("creating a new path towards (" + string(newX), + ", " + string(newY))
			var path = path_add();
			mp_grid_path(objGameController.worldMap, path, x, y, newX, newY, true);
			
			path_start(path, pathSpd, path_action_stop, 0)
			
			
			movingToSpot = true;
		}
		
		if(x > newX)
		{
			image_xscale = 1;
		}
		
		else{image_xscale = -1}
	}
}