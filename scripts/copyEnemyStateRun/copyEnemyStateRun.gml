// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function copyEnemyStateRun()
{
	if (path_index != -1) path_end();
	var dir = point_direction(x, y, objTDPlayer.x, objTDPlayer.y)

	if(distance_to_object(objTDPlayer) <= healDistance)
	{
		hsp = lengthdir_x(moveSpd, -dir);
		vsp = lengthdir_y(moveSpd, -dir);
	}
	
	else
	{
		currentState = COPYENEMYSTATE.HEAL	
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