if(room != Room1)
{
	if(currentState == PLAYERSTATE.ATTACK || currentState == PLAYERSTATE.COMBO)
	{
		if(weaponType != "STAFF")
		{
			if(!queCombo)
			{
				currentState = PLAYERSTATE.MOVE;
				startAtk = false;
				playerAnimation(currentState, moveH, moveV)
				curatkCooldown = atkCooldown;	
			}
	
			else
			{
				audio_play_sound(swordSwish, 1, false);
				startAtk = false;
				currentState = PLAYERSTATE.COMBO
				queCombo = false;
			}
		}
		
		else
		{
			var spell = grabAttack(mAttacks[3])
			if(!is_undefined(spell))
			{
				show_debug_message(spell[? "Mana"])
				if(mana >= spell[? "Mana"])
				{
					
					// Projectile : moveLocation = {lightDegree: 2, targX: mouse_x, targY: mouse_y, spd: 2, lifeTime: 180, attackData: mAttacks[3]};
					// AOE
					moveLocation = {lightDegree: 2, lifeTime: 180, atkData: mAttacks[3], holdTime: 120, range: 60};
					instance_create_layer(x, y,  "Instances", objAOE, moveLocation);
					curatkCooldown = atkCooldown;	
					mana -= spell[? "Mana"];
					
					playerAnimation(currentState, moveH, moveV)
					startAtk = false;
					currentState = PLAYERSTATE.MOVE;
				}
				
				else
				{
					playerAnimation(currentState, moveH, moveV)
					startAtk = false;
					currentState = PLAYERSTATE.MOVE;	
				}
			}
			
			
		}
		
	
	}
	
	
}



