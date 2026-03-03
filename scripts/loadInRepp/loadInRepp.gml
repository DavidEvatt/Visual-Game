// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInRepp()
{
	 var fileLocation = working_directory + "PlayerData/reputationSave.json";
    
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
		
		var tags = []
		tags = ds_map_keys_to_array(allData, tags)
		
		for(var i = 0; i < array_length(tags); i++)
		{
			show_debug_message("Tag of file is :" + string(tags[i]))
			ds_map_add(reputationTable, tags[i], allData[? tags[i]])
		}
	}
	
	else show_debug_message(fileLocation + " does not exist")
}