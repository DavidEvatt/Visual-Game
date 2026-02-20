// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadPlayerQuestBounties()
{
	var fileLocation = working_directory + "PlayerData/questsSave.json";
    
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
		
		var bounties = ds_map_find_value(allData, "Bounties");
		
		for(var i = 0; i < ds_list_size(bounties); i++)
		{
			var bountyMap = bounties[| i];     //  ds_list access
		    var bountiesID  = bountyMap[? "ID"]; // ds_map access
		    var bountiesProgress  = bountyMap[? "progress"]; // ds_map access


		    ds_map_add(objTDPlayer.playerBounties, bountiesID, bountiesProgress);
		}
		
		var quests = ds_map_find_value(allData, "Quests");
		
		for(var i = 0; i < ds_list_size(quests); i++)
		{
			var questMap = quests[| i];     //  ds_list access
		    var questsID  = questMap[? "ID"]; // ds_map access
		    var questsProgress  = questMap[? "progress"]; // ds_map access


		    ds_map_add(objTDPlayer.playerQuests, questsID, questsProgress);
		}
	}
}