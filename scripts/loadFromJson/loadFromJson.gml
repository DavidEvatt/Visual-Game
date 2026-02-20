function loadFromJson(nodeFileName) 
{
	objGameController.actionsArray = [];
	objGameController.previousNode = objGameController.currentNode;
	objChoicePanel.currentOption = 0;
	
	objChoicePanel.currentState = CHOICESTATE.JSON;
	objMainText.currentState = MAINAREA.JSON;

	var fileLocation = working_directory + "GameData/LocationData/" + nodeFileName;
	
	
	//show_debug_message("loading into " + fileLocation)
	
	if(file_exists(fileLocation))
	{
		var json = "";
		var file = file_text_open_read(fileLocation);
		
		while(!file_text_eof(file))
		{
			json += file_text_readln(file);
		}
		
		file_text_close(file);
		
		objGameController.location = json_decode(json);
		objGameController.mainText = objGameController.location[? "header"]
		
		if(!is_undefined(objGameController.location[? "region"]))
		{
			objGameController.curRegion = ds_map_find_value(objGameController.regionMap, objGameController.location[? "region"])	
		}
		
		var actionList = ds_map_find_value(objGameController.location, "Actions")
		for(var i = 0; i < ds_list_size(actionList); i++)
		{
			objGameController.actionsArray[i] = ds_list_find_value(actionList, i);
		}
	}
	
	/*if(objGameController.location[? "questEffect"] != undefined)
	{
		var questEffects = objGameController.location[? "questEffect"];
		
		for(var k = 0; k < ds_list_size(questEffects); k++)
		{
			var quest = ds_list_find_value(questEffects, k)
			if(hasQuest(quest[? "questID"]))
			{
				appendActions(quest[? "questID"]);
			}
		}
		
	}*/
}