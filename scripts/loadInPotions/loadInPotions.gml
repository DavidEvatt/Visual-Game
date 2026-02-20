// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInPotions(fileDirectory)
{
	var fileLocation = working_directory + "GameData/PotionData/" + fileDirectory;
    
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
		
		var potion = ds_map_find_value(allData, "Potions");
		
		if(!is_undefined(potion))
		{
			for(var i = 0; i < ds_list_size(potion); i++)
			{
				potionDatabase[i] = ds_list_find_value(potion, i);	
			
			}
		}
	}
}