// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInCrafting(fileDirectory)
{
    var fileLocation = working_directory + "GameData/CraftingData/" + fileDirectory;
    
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
		
		var material = ds_map_find_value(allData, "Crafting Materials");
		
		for(var i = 0; i < ds_list_size(material); i++)
		{
			craftingMaterials[i] = ds_list_find_value(material, i);	
			
			ds_map_add(craftingColors, craftingMaterials[i][? "ID"], make_color_rgb(craftingMaterials[i][? "R"], craftingMaterials[i][? "G"], craftingMaterials[i][? "B"]))
			
		}
	}
}
