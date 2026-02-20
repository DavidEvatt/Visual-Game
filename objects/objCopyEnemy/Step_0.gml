
switch(currentState)
{
	case COPYENEMYSTATE.IDLE: copyEnemyStateIdle(); break;
	case COPYENEMYSTATE.INCOMBAT: copyEnemyStateInCombat(); break;
	case COPYENEMYSTATE.DODGE: copyEnemyStateDodge(); break;
	case COPYENEMYSTATE.RUN: copyEnemyStateRun(); break;
	case COPYENEMYSTATE.HEAL: copyEnemyStateHeal(); break;
	case COPYENEMYSTATE.ATTACK: copyEnemyStateAttack(); break;
	case COPYENEMYSTATE.HIT:
	{	
		if (path_index != -1) path_end();
		if(sprite_index != sprPlayerSouthWalk)
		{
			image_index = 0
			sprite_index = sprPlayerSouthWalk;
			mask_index = sprite_index;
		}
		
		if(knockback > 0)
		{
			knockback -= knockbackDecline;	
			var dir = point_direction(objTDPlayer.x, objTDPlayer.y, x, y);
	
			hsp = lengthdir_x(knockback, dir);
			vsp = lengthdir_y(knockback, dir);
			
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
		
		else
		{
			hsp = 0; 
			vsp = 0; 
		}
		break;	
	}
}


if(atkCooldown > 0)
{
	atkCooldown--;	
}

if(currentState == COPYENEMYSTATE.ATTACK && curCharge < chargeUp)
{
	curCharge++;	
}

if(holdNewSpotTimer > 0)
{
	holdNewSpotTimer--;	
}

if(holdTempLocationTimer > 0)
{
	holdTempLocationTimer--;	
}

else
{
	if(tempHomeX != undefined)
	{
		//show_debug_message("no Longer holding temp state")
		tempHomeX = undefined;
		tempHomeY = undefined;
	}
}

if(hpDisplay != hp)
{
	hpDisplay = lerp(hpDisplay, hp, varDisplaySpd);

	// Snap to actual hp when close
	if (abs(hpDisplay - hp) < 0.1) hpDisplay = hp;
}

if(dodgeTimer > 0)
{
	dodgeTimer--;	
}

if(dodgeTimer <= 0)
{
	if(isDodging){isDodging = false; curDodgeCD = maxDodgeCD}
	if(currentState == COPYENEMYSTATE.DODGE && needsDodge){needsDodge = false}
}

if(curDodgeCD > 0)
{
	curDodgeCD--;	
}

if(curHitStun > 0)
{
	curHitStun--;
}

else
{
	if(currentState == COPYENEMYSTATE.HIT)
	{
		currentState = COPYENEMYSTATE.INCOMBAT; 
		beenHit = false;
	}
}