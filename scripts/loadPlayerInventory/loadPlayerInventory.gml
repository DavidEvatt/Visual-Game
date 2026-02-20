// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadPlayerInventory()
{
	var loadAtk = 0;
	var json = "";
	var fileLocation = working_directory + "PlayerData/inventory.json";
    
	if(file_exists(fileLocation))
	{
		var file = file_text_open_read(fileLocation);
		
		while(!file_text_eof(file))
		{
			json += file_text_readln(file);	
		}
		
		file_text_close(file);
		
		var allData = json_decode(json);
		
		var attacks = ds_map_find_value(allData, "Inventory");
		
		for(var i = 0; i < ds_list_size(attacks); i++)
		{
			var attackMap = attacks[| i];     //  ds_list access
			var attackVal = attackMap[? "amt"];     //  ds_list access
		    var attackID  = attackMap[? "ID"]; // ds_map access

			increaseInventory(attackID, attackVal);
			loadAtk++;
		}
	}
}