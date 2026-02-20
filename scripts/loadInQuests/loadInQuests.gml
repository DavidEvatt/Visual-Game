// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInQuests()
{
	var fileLocation = working_directory + "GameData/QuestData/Quests.json";
    
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
		
		var quests = ds_map_find_value(allData, "Quests");
		var bounty = ds_map_find_value(allData, "Bounties");
		
		if(!is_undefined(quests))
		{
			for(var i = 0; i < ds_list_size(quests); i++)
			{
				allQuests[i] = ds_list_find_value(quests, i);	
				show_debug_message("Its a quest | " + allQuests[i][? "id"])
			
			}
		}
		
		if(!is_undefined(bounty))
		{
			
			for(var i = 0; i < ds_list_size(bounty); i++)
			{
				allBounties[i] = ds_list_find_value(bounty, i);	
				if( string_count("ewGCBouty", ds_list_find_value(bounty, i)[? "id"]) > 0)
				{
					var size = array_length(ElderwellActions.regionalBounties);
					ElderwellActions.regionalBounties[size] = allBounties[i];
					show_debug_message(ElderwellActions.regionalBounties[size][? "id"])
				}
			}
		}
		
		show_debug_message("regionalBountySize: " + string(array_length(ElderwellActions.regionalBounties)))
	}
    
}