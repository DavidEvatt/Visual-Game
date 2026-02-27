// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveQuestsBounties()
{
	var reader;
	var questStruct;
	var bountyStruct;
	var bountyArray = [];
	var questArray = [];
	
	var json = "";
    var file = file_text_open_read(working_directory + "PlayerData/questsSave.json");
    while (!file_text_eof(file)) json += file_text_readln(file);
    file_text_close(file);

    reader = json_decode(json);

    // Use existing array if it exists, otherwise create a new one
       /* 
	//read in the quests
	if(!is_undefined(reader))
	{
		var quests = ds_map_find_value(reader, "Quests");
		
		for(var i = 0; i < ds_list_size(quests); i++)
		{
			var whatAreYou = quests[| i];
			questStruct = 
			{
				ID   : whatAreYou[? "ID"],
				progress : whatAreYou[? "progress"]
			};
		
			array_push(questArray, questStruct);
		}
	
		//read in the bounties
		var bounty = ds_map_find_value(reader, "Bounties");
		
		for(var i = 0; i < ds_list_size(bounty); i++)
		{
			var whatAreYou = bounty[| i];
			bountyStruct = 
			{
				ID   : whatAreYou[? "ID"],
				progress : whatAreYou[? "progress"]
			};
			array_push(bountyArray, bountyStruct);

		}
	}*/
	
	
	var bouMap = objTDPlayer.playerBounties;
	var bouKeys = ds_map_keys_to_array(bouMap);

	for (var i = 0; i < array_length(bouKeys); i++)
	{
		var itemID = bouKeys[i];
		var amount = bouMap[? itemID];
		var bount = {
		    ID: itemID,
		    progress: amount
		};
		
		
		array_push(bountyArray, bount);
		
	}
		
	var queMap = objTDPlayer.playerQuests;
	var queKeys = ds_map_keys_to_array(queMap);

	for (var i = 0; i < array_length(queKeys); i++)
	{
		var itemID = queKeys[i];
		var amount = queMap[? itemID];

		
		var ques = {
		    ID: itemID,
		    progress: amount
		};
		
		
		array_push(questArray, ques);
		
	}
		
	var saveRoot = {
		Bounties: bountyArray,
		Quests: questArray
	};
		
	if (!directory_exists("PlayerData"))
	{
		directory_create("PlayerData");
	}

	json = json_stringify(saveRoot);

	file = file_text_open_write("PlayerData/questsSave.json");
	file_text_write_string(file, json);
	file_text_close(file);
}