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
			var eRegion = enemy[? "Region"];
	        switch (eRegion)
			{
	            case "ElderwellForest1": ds_map_add(tier1, i, enemy); break;
	            case "ElderwellForest2": ds_map_add(tier2, i, enemy); break;
	            case "ElderwellForest3": ds_map_add(tier3, i, enemy); break;
	            case "ElderwellForest4": ds_map_add(tier4, i, enemy); break;
	            case "ElderwellForest5": ds_map_add(tier5, i, enemy); break;
	        }
		}
		
		ds_map_add(tieredEnemies, "ElderwellForest1", tier1);
		ds_map_add(tieredEnemies, "ElderwellForest2", tier2);
		ds_map_add(tieredEnemies, "ElderwellForest3", tier3);
		ds_map_add(tieredEnemies, "ElderwellForest4", tier4);
		ds_map_add(tieredEnemies, "ElderwellForest5", tier5);


	}
}