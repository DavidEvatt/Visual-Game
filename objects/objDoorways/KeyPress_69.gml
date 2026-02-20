if(!is_undefined(shop))
{
	show_debug_message("Shop is not undefined")
	if(shop.open)
	{
		show_debug_message("Shop is open")
		if(place_meeting(x, y, objTDPlayer))
		{
			if(room != target)
			{
				objTDPlayer.x = targX
				objTDPlayer.y = targY;
				
				shop = undefined
				room_goto(target)
				
				show_debug_message(shop)
			}
			shop = undefined
		}
	}

	else
	{
		show_debug_message("Shop Is locked")
	}
}

else
{
	if(place_meeting(x, y, objTDPlayer))
	{
		if(room != target)
		{
			objTDPlayer.x = targX
			objTDPlayer.y = targY;
				
				
			room_goto(target)
		}
	}
}











