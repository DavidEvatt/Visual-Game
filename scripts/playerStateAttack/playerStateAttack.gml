// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateAttack()
{
	if(vsp > 0)
	{
		vsp--;
	}
	
	else if(vsp < 0)
	{
		vsp++
	}
	
	if(hsp > 0)
	{
		hsp--;
	}
	
	else if(hsp < 0)
	{
		hsp++;	
	}
	
	switch(weaponType)
	{
		case "SWORD":
		{
			switch(dir)
			{
				case "LEFT":
				{
					if(startAtk == false)
					{
						image_index = 0;
						image_xscale = -1
						if(sprite_index != sprPlayerEastSlash2)
						{
							sprite_index = sprPlayerEastSlash2
							mask_index = sprPlayerEastSlashHB2
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;	
				}
					
				case "RIGHT":
				{
					if(startAtk == false)
					{
						image_index = 0;
						image_xscale = 1
						if(sprite_index != sprPlayerEastSlash2)
						{
							sprite_index = sprPlayerEastSlash2
							mask_index = sprPlayerEastSlashHB2
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}
				
				case "DOWN":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprPlayerSouthSlash2)
						{
							image_index = 0;
							sprite_index = sprPlayerSouthSlash2
							mask_index = sprPlayerSouthSlash2HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}
				
				case "UP":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprPlayerNorthSlash2)
						{
							image_index = 0;
							sprite_index = sprPlayerNorthSlash2
							mask_index = sprPlayerNorthSlash2HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}
			}
				
			break;
		}
		
		case "FIST":
		{
			switch(dir)
			{
				case "LEFT":
				{
					if(startAtk == false)
					{
						image_index = 0;
						image_xscale = -1
						if(sprite_index != sprPlayerEastPunch3)
						{
							sprite_index = sprPlayerEastPunch3
							mask_index = sprPlayerEastPunch3HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;	
				}
					
				case "RIGHT":
				{
					if(startAtk == false)
					{
						image_index = 0;
						image_xscale = 1
						if(sprite_index != sprPlayerEastPunch3)
						{
							sprite_index = sprPlayerEastPunch3
							mask_index = sprPlayerEastPunch3HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}
				
				case "DOWN":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprPlayerSouthPunch2)
						{
							image_index = 0;
							sprite_index = sprPlayerSouthPunch2
							mask_index = sprPlayerSouthPunch2HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}
				
				case "UP":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprPlayerNorthSlash2)
						{
							image_index = 0;
							sprite_index = sprPlayerNorthSlash2
							mask_index = sprPlayerNorthSlash2HB
						}
						
						comboBuffer = maxComboBuffer
							
						startAtk = true;
					}
					break;
				}

			}
			
			break;
		}
		
		case "STAFF":
		{
			if(startAtk == false)
			{
				if(sprite_index != sprPlayerNorthSlash2)
				{
					image_index = 0;
					sprite_index = sprPlayerNorthSlash2
					mask_index = sprPlayerNorthSlash2HB
				}
						
				comboBuffer = maxComboBuffer
							
				startAtk = true;
			}
			break;	
		}
	}
	

	if(weaponType != "STAFF")
	{
		if(keyAttack && comboBuffer <= 0)
		{
			queCombo = true;	
		}
	
	
		if(place_meeting(x, y, objEnemy))
		{
			var targ = instance_nearest(x, y, objEnemy)
			if(targ.currentState != ENEMYSTATE.HIT && !targ.beenHit && !targ.isDodging)
			{
				show_debug_message("Hit on Attack")
				targ.beenHit = true;
				applyEffects(targ, objTDPlayer.weapon, "P");
				enemyHit(targ);
				EnemyDeath(targ);
			}
		
		}
	}
	
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
		
		else if (place_meeting(x + hsp, y, objFloor)) 
		{
		    while (!place_meeting(x + sign(hsp), y, objFloor)) 
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
		
		else if (place_meeting(x, y + vsp, objFloor)) 
		{
		    while (!place_meeting(x, y + sign(vsp), objFloor)) 
		    {
		        y += sign(vsp); // Move down pixel by pixel until flush with the floor
		    }
		    vsp = 0; // Stop falling
		} 
    
		else y = lerp(y, y + vsp, 1); // Move normally in the air
		
	#endregion
}