// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increaseInventory(IDtoIncrease, amt)
{
	if(ds_map_exists(objTDPlayer.materialInventory, IDtoIncrease))
	{
		objTDPlayer.materialInventory[? IDtoIncrease] += amt;
	}
	
	else if(ds_map_exists(objTDPlayer.potionInventory, IDtoIncrease))
	{
		objTDPlayer.potionInventory[? IDtoIncrease] += amt;
	}
	
	else
	{
		show_debug_message(IDtoIncrease + " Is an invalid ID");	
	}
}