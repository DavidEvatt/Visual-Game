if(is_undefined(shop) && room == Room2)
{
	show_debug_message("Reseting shop")
	shop = instance_nearest(x, y, shopRef);	
}

if(room != Room2)
{
	shop = undefined;	
}