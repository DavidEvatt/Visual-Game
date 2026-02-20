// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateCombo()
{
	vsp = 0;
	hsp = 0;
	
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
						if(sprite_index != sprPlayerEastSlash3)
						{
							sprite_index = sprPlayerEastSlash3
							mask_index = sprPlayerEastSlashHB3
						}
							
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
						if(sprite_index != sprPlayerEastSlash3)
						{
							sprite_index = sprPlayerEastSlash3
							mask_index = sprPlayerEastSlashHB3
						}
						
						startAtk = true;
					}
					break;
				}
				
				case "DOWN":
				{
					if(startAtk == false)
					{
						image_index = 0;
						if(sprite_index != sprPlayerSouthSlash3)
						{
							sprite_index = sprPlayerSouthSlash3
							mask_index = sprPlayerSouthSlash3HB
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
						image_index = 0;
						if(sprite_index != sprPlayerNorthSlash3)
						{
							sprite_index = sprPlayerNorthSlash3
							mask_index = sprPlayerNorthSlash3HB
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
						if(sprite_index != sprPlayerEastPunch2)
						{
							sprite_index = sprPlayerEastPunch2
							mask_index = sprPlayerEastPunch2HB
						}
							
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
						if(sprite_index != sprPlayerEastPunch2)
						{
							sprite_index = sprPlayerEastPunch2
							mask_index = sprPlayerEastPunch2HB
						}
							
						startAtk = true;
					}
					break;
				}
			
				case "DOWN":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprPlayerSouthPunch3)
						{
							image_index = 0;
							sprite_index = sprPlayerSouthPunch3
							mask_index = sprPlayerSouthPunch3HB
						}

						startAtk = true;
					}
					break;
				}
			}
		}
	}

	if(place_meeting(x, y, objEnemy))
	{
		
		var targ = instance_nearest(x, y, objEnemy)
		if(targ.currentState != ENEMYSTATE.HIT && !targ.beenHit && !targ.isDodging)
		{
			show_debug_message("Hit on Combo")
			targ.beenHit = true;
			applyEffects(targ, objTDPlayer.weapon, "P");
			enemyHit(targ);
			EnemyDeath(targ);
		}
		
	}
}