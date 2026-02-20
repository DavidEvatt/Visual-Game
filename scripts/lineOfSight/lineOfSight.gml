// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lineOfSight()
{
	var returnVal = false;
	// Define ray parameters
	var ray_dir = 0;
	var ray_length = distance_to_object(objTDPlayer);
	var hit_x = 0;
	var hit_y = 0;
	
	// Update direction (e.g., towards mouse)
	ray_dir = point_direction(x, y, objTDPlayer.x, objTDPlayer.y);

	// Initialize hitting variables
	hit_x = x + lengthdir_x(ray_length, ray_dir);
	hit_y = y + lengthdir_y(ray_length, ray_dir);

	// Perform Raycast (step pixel by pixel)
	for (var i = 0; i < ray_length; i += 1) {
	    var check_x = x + lengthdir_x(i, ray_dir);
	    var check_y = y + lengthdir_y(i, ray_dir);
    
	    // Check for collision with wall object
	    if (place_meeting(check_x, check_y, objWall)) {
	        hit_x = check_x;
	        hit_y = check_y;
			returnVal = false;
			
	        break; // Stop at first collision
	    }
		
		else
		{
			returnVal = true;	
		}
	}
	
	return returnVal
}