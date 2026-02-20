// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerAnimation(state, moveX, moveY)
{
	
	var isIdle = false;
	
	switch(state)
	{
		
		case PLAYERSTATE.MOVE:
		{
			
			if(moveX == 0 && moveY == 0)
			{
				isIdle = true;
			}
			
			else if(moveY > 0)
			{
				dir = "DOWN"
			}
			
			else if(moveY < 0)
			{
				dir = "UP"	
			}
			
			else if(moveX > 0)
			{
				dir = "RIGHT"	
			}
			
			else if(moveX < 0)
			{
				dir = "LEFT"	
			}
			
			switch(dir)
			{
				case "RIGHT":
				{
					
					image_xscale = 1;
					
					if(!isIdle)
					{
						if(sprite_index != sprPlayerEastWalk)
						{
							sprite_index = sprPlayerEastWalk;
						}
					}
					
					else
					{
						if(sprite_index != sprPlayerEastIdle)
						{	
							sprite_index = sprPlayerEastIdle;
						}
					}
					
					break;
				}
				
				case "LEFT":
				{
					image_xscale = -1;
					
					if(!isIdle)
					{
						if(sprite_index != sprPlayerEastWalk)
						{
							sprite_index = sprPlayerEastWalk;
						}
					}
					
					else
					{
						if(sprite_index != sprPlayerEastIdle)
						{
							sprite_index = sprPlayerEastIdle;
						}
					}
					
					break;
				}
				
				case "DOWN":
				{
					if(!isIdle)
					{
						if(sprite_index != sprPlayerSouthWalk)
						{
							sprite_index = sprPlayerSouthWalk;
						}
					}
					
					else
					{
						if(sprite_index != sprPlayerSouthIdle)
						{
							sprite_index = sprPlayerSouthIdle;
						}
					}
					
					break;
				}
				
				case "UP":
				{
					if(!isIdle)
					{
						if(sprite_index != sprPlayerNorthWalk)
						{
							sprite_index = sprPlayerNorthWalk;
						}
					}
					
					else
					{
						if(sprite_index != sprPlayerSouthIdle)
						{
							sprite_index = sprPlayerSouthIdle;
						}
					}
					
					break	
				}
			}
			
			mask_index = sprite_index;
			
			break;	
		}
	}
}