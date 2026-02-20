
var item = grabWeapon(itemID);

	
if(!is_undefined(item))
{
	var weaponColor = [];
	for(var i = 0; i < 3; i++)
	{
		var index = ds_list_find_value(item[? "Part Colors"], i);
		var thisOne = make_color_rgb(index[? "R"], index[? "G"], index[? "B"]);
		array_push(weaponColor, thisOne);
	}	
		
	colorMyself(
		self,
		objTDPlayer.playerColors[0],
		objTDPlayer.playerColors[1],
		objTDPlayer.playerColors[2],
		objTDPlayer.playerColors[3],
		objTDPlayer.playerColors[4],
		objTDPlayer.playerColors[5],
		weaponColor[0],
		weaponColor[1],
		weaponColor[2],
		weaponColor[0]
	)	
}


	
draw_self();
shader_reset();

draw_set_font(ftInteract)

draw_text(x-10, y + 24, string(price) + " Coins")

if(place_meeting(x, y + 24, objTDPlayer))
{
	draw_text(x-10, y - 16, "<E> to buy")
}








