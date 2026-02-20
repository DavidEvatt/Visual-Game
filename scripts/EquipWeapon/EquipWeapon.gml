// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EquipWeapon(weaponId)
{
	var newWeapon = grabWeapon(weaponId);
	var curWeapon = grabWeapon(objTDPlayer.weapon);
	
	if(!hasWeapon(weaponId))
	{
		ds_list_add(objTDPlayer.obtainedWeapons, weaponId);	
	}
	
	if(!is_undefined(newWeapon) && !is_undefined(curWeapon))
	{
		objTDPlayer.maxHp -= curWeapon[? "baseHealth"];
		objTDPlayer.hp -= curWeapon[? "baseHealth"];
		
		if(objTDPlayer.hp <= 0){objTDPlayer.hp = 1};
		
		objTDPlayer.maxHp += newWeapon[? "baseHealth"];
		objTDPlayer.hp += newWeapon[? "baseHealth"];
		objTDPlayer.weapon = weaponId;
		
		objTDPlayer.maxMana -= curWeapon[? "baseMana"];
		objTDPlayer.mana -= curWeapon[? "baseMana"];
		
		if(objTDPlayer.mana <= 0){objTDPlayer.mana = 1};
		
		objTDPlayer.maxMana += newWeapon[? "baseMana"];
		objTDPlayer.mana += newWeapon[? "baseMana"];
		objTDPlayer.weapon = weaponId;
		
		objTDPlayer.weaponType = newWeapon[? "type"]
		
		
		for(var i = 0; i < 3; i++)
		{
			var index = ds_list_find_value(newWeapon[? "Part Colors"], i);
			objTDPlayer.weaponColor[i] =make_color_rgb(index[? "R"], index[? "G"], index[? "B"]);
		}	
	}
	
	else
	{
		show_debug_message("Got an undefined")	
	}
}