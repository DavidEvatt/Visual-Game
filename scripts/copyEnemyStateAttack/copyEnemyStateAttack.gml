// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function copyEnemyStateAttack()
{
	var dir = scrFacingDirection();
	
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
						if(sprite_index != sprCopyEastSlash2)
						{
							sprite_index = sprCopyEastSlash2
							mask_index = sprPlayerEastSlashHB2
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
						if(sprite_index != sprCopyEastSlash2)
						{
							sprite_index = sprCopyEastSlash2
							mask_index = sprPlayerEastSlashHB2
						}
							
						startAtk = true;
					}
					break;
				}
				
				case "DOWN":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprCopySouthSlash2)
						{
							image_index = 0;
							sprite_index = sprCopySouthSlash2
							mask_index = sprPlayerSouthSlash2HB
						}
							
						startAtk = true;
					}
					break;
				}
				
				case "UP":
				{
					if(startAtk == false)
					{
						if(sprite_index != sprCopyNorthSlash2)
						{
							image_index = 0;
							sprite_index = sprCopyNorthSlash2
							mask_index = sprPlayerNorthSlash2HB
						}
					
							
						startAtk = true;
					}
					break;
				}
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