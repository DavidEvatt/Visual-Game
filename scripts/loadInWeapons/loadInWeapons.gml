
function loadInWeapons(fileDirectory)
{
	var startNext = 0;
    var fileLocation = working_directory + "GameData/AttackData/" + fileDirectory;
    
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
		
		if(!is_undefined(attacks))
		{
			for(var i = 0; i < ds_list_size(attacks); i++)
			{
				array_push(objGameController.weaponList, ds_list_find_value(attacks, i))
				startNext++;
			}
		}
	}
	
	
	
	fileLocation = working_directory + "PlayerData/customCombat.json";
    
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
		
		if(!is_undefined(attacks))
		{
			for(var i = 0; i < ds_list_size(attacks); i++)
			{
				array_push(objGameController.weaponList, ds_list_find_value(attacks, i))
	
			}
		}
	}
	
	else
	{
		show_debug_message("no file exists")	
	}
}
