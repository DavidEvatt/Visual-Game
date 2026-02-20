// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabQuest(idToGrab)
{
	var returnQuest = undefined
	
	for (var i = 0; i < array_length(objGameController.allQuests); i++) 
	{
	    if (objGameController.allQuests[i][? "id"] == idToGrab) 
		{
	        returnQuest = objGameController.allQuests[i];
			break;
	    }
	}
	
	if(returnQuest == undefined)
	{
		for (var i = 0; i < array_length(objGameController.allBounties); i++) 
		{
		    if (objGameController.allBounties[i][? "id"] == idToGrab) 
			{
		        returnQuest = objGameController.allBounties[i];
				break;
		    }
		}
	}
	
	if(returnQuest == undefined)
	{
		show_debug_message("Somethign wrong boss");	
	}
	
	return returnQuest;
}