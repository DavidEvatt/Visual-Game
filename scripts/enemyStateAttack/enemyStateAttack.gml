// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyStateAttack()
{
	switch(enemyType)
	{
		case "Slime":
		{
			var index = irandom(1) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprSlime1; break;
				case 2:	sprite_index = sprSlime2; break;
			}
		
			break;	
		}
		
		case "Squirrel":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprSquirell1; break;
			}
		
			break;
		}
	
		case "Rabbit":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprBunny1; break;
			}
		
			break;
		}
	
		case "Wolf":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	
				{
					if(sprite_index != sprWolf1Atk)
					{
						image_index = 0;
						sprite_index = sprWolf1Atk; 
						mask_index = sprWolf1AtkHB; 
					}
					
					break;
				}
			}
			
			hsp = 0;
			vsp = 0;
		
			break;
		}
	
		case "Boar":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	
				{
					if(sprite_index != sprBoar1Atk)
					{
						image_index = 0;
						sprite_index = sprBoar1Atk; mask_index = sprBoar1AtkHB; 
					}
					
					break;
				}
			}
			
			if(curCharge >= chargeUp && canCharge)
			{
				path_end();
				var dir = point_direction(x, y, targX, targY);
				hsp = lengthdir_x(3, dir);
				vsp = lengthdir_y(3, dir);
				canCharge = false;
				
				var ang = point_direction(x, y, targX, targY);
				var dist = point_distance(x, y, targX, targY);
				var overshoot = 16; // pixels past the player
				var dashDist = dist + overshoot;
				
				var endX = x + cos(degtorad(ang)) * dashDist;
				var endY = y - sin(degtorad(ang)) * dashDist;
				
				with(self)
				{
					var path = path_add();
					if(mp_grid_path(objGameController.worldMap, path, x, y, endX, endY, true))
					{
						path_start(path, moveSpd * 4, path_action_stop, 0)	
					}
				}
			}
					
			else if (curCharge < chargeUp)
			{
				hsp = 0;
				vsp = 0;
				if (path_index != -1) path_end();
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
			#endregion
		*/
			break;
		}
		
		case "Lightning Rabbit":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprLightningBunny1; break;
			}
		
			break;
		}
		
		case "Stump Golem":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprStumpG1; break;
			}
		
			break;
		}
	}

	if(place_meeting(x, y, objTDPlayer))
	{
		if(objTDPlayer.iframes <= 0)
		{
			audio_play_sound(hitSound, 1, false);
			objTDPlayer.curHitStun = objTDPlayer.maxHitStun;
			objTDPlayer.iframes = objTDPlayer.maxIframes;
			objTDPlayer.hp -= 5;
		}
		
	}
}