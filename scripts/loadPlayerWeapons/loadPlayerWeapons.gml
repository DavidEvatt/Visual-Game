
function loadPlayerWeapons()
{
	var loadAtk = 0;
	var fileLocation = working_directory + "PlayerData/obtainedWeapons.json";
    
	if(file_exists(fileLocation))
	{
		var json = "";
		var file = file_text_open_read(fileLocation);
		
		while(!file_text_eof(file))
		{
			json += file_text_readln(file);	
		}
		
		file_text_close(file);
		
		var allData = json_decode(json);
		
		var attacks = ds_map_find_value(allData, "Weapons");
		
		for(var i = 0; i < ds_list_size(attacks); i++)
		{
			var attackMap = attacks[| i];     //  ds_list access
		    var attackID  = attackMap[? "ID"]; // ds_map access

		    ds_list_add(objTDPlayer.obtainedWeapons, attackID);
			loadAtk++;
		}
	}
}