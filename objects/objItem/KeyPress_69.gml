if(place_meeting(x, y + 24, objTDPlayer))
{
	var type = "weapon"
	var item = grabWeapon(itemID);
	
	if(is_undefined(item))
	{
		item = grabMaterial(itemID)
		type = "material"
	}
	
	if(is_undefined(item))
	{
		item = grabPotion(itemID);	
		type = "potion"
	}
	
	
	switch(type)
	{
		case "weapon":
		{
			EquipWeapon(itemID)
			
			break;
		}
		
		case "material":
		{
			increaseInventory(itemID, 1)
			break;
		}
		
		case "potion":
		{
			increaseInventory(itemID, 1)	
			break;
		}
	}
	
	amount--;
}











