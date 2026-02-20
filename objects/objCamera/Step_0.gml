if(target != objTDPlayer)
{
	target = objTDPlayer;	
}

var cam = view_camera[0];

var targetX = target.x - camera_get_view_width(cam) / 2;
var targetY = target.y - camera_get_view_height(cam) / 2;

var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);

var camWidth = camera_get_view_width(view_camera[0]);
var camHeight = camera_get_view_height(view_camera[0])

var finalX = 0
var finalY = 0

if(room_width <= camWidth && room_height <= camHeight)
{
	 finalX = 0
	 finalY = 0
}

else
{
	finalX = clamp(targetX, 0, room_width - camWidth);
	finalY = clamp(targetY, 0, room_height - camHeight)	
}


var currentX = lerp(camX, finalX, 0.05)
var currentY = lerp(camY, finalY, 0.05)

camera_set_view_pos(
    cam,
    currentX,
	currentY
);









