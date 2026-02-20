// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hasWeapon(weaponID)
{
	var returnVal = false;
	
	for(var i = 0; i < ds_list_size(objTDPlayer.obtainedWeapons); i++)
	{
		if(weaponID == ds_list_find_value(objTDPlayer.obtainedWeapons, i))
		{
			returnVal = true;	
		}
	}
	
	return returnVal;
}