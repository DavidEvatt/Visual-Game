// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hasQuest(questID)
{
	var returnVal = false;
	
	if(ds_map_exists(objPlayer.playerBounties, questID))
	{
		returnVal = true;	
	}
	
	if(ds_map_exists(objPlayer.playerQuests, questID) && !returnVal)
	{
		returnVal = true;	
	}
	
	return returnVal;
}