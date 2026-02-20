// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInNpc(ID)
{
	 var fileLocation = working_directory + "GameData/NPCData/NPCs.json";
    
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
		
		var npcs = ds_map_find_value(allData, "NPCS");
		
		for(var i = 0; i < ds_list_size(npcs); i++)
		{
			var curNPC = ds_list_find_value(npcs, i)
			
			if(ID == curNPC[? "ID"])
			{
				var events = curNPC[? "Events"];
				if(is_undefined(ds_list_find_value(events, 0)))
				{
					show_debug_message("Events at 0 is undefined");
				}
				
				else 
				{
					show_debug_message("Event at 0 is not Undefined");
					var event0 = ds_list_find_value(events, 0);
					show_debug_message(string(event0[? "startTime"]));
				}
				
				schedule = events;
			}
			
		}
	}
}