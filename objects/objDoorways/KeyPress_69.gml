if(!is_undefined(shop))
{
	if(shop.open)
	{
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











