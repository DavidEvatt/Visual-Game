function loadInEnemies(nodeFileName, regionToUse)
{
	var tier1 = ds_map_create();
	var tier2 = ds_map_create();
	var tier3 = ds_map_create();
	var tier4 = ds_map_create();
	var tier5 = ds_map_create();

	
	var fileLocation = working_directory + "GameData/EnemyData/" + nodeFileName;
	if(file_exists(fileLocation))
	{
		var json = "";
		var file = file_text_open_read(fileLocation);
		
		while(!file_text_eof(file))
		{
			json += file_text_readln(file);
		}
		
		file_text_close(file);
		
		var jsonData = json_decode(json);
		
		var usageRegion = jsonData[? regionToUse]
		
		for(var i = 0; i < ds_list_size(usageRegion); i++)
		{
			var enemy = ds_list_find_value(usageRegion, i);
			var level = enemy[? "Level"];
	        switch (level) 
			{
	            case 1: ds_map_add(tier1, i, enemy); break;
	            case 2: ds_map_add(tier2, i, enemy); break;
	            case 3: ds_map_add(tier3, i, enemy); break;
	            case 4: ds_map_add(tier4, i, enemy); break;
	            case 5: ds_map_add(tier5, i, enemy); break;
	        }
		}
		
		ds_map_add(tieredEnemies, "1", tier1);
		ds_map_add(tieredEnemies, "2", tier2);
		ds_map_add(tieredEnemies, "3", tier3);
		ds_map_add(tieredEnemies, "4", tier4);
		ds_map_add(tieredEnemies, "5", tier5);


	}
}