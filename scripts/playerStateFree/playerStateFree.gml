// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateFree()
{
	moveH = keyRight - keyLeft;
	moveV = keyDown - keyUp; 

	hsp = moveSpd * moveH;
	vsp = moveSpd * moveV;
	
	if(keySpace)
	{
		var dir = point_direction(x, y, x + moveH, y + moveV)

		hsp += lengthdir_x(60, dir)
		vsp += lengthdir_y(60, dir )
	
	}
	
	playerAnimation(currentState, moveH, moveV)
	
	if(keyAttack && curatkCooldown <= 0)
	{
		audio_play_sound(swordSwish, 1, false);
		currentState = PLAYERSTATE.ATTACK	
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