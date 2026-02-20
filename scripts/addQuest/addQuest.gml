// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addQuest(questID)
{
	var quest = grabQuest(questID);
	
	if(!is_undefined(quest))
	{
	
		if(quest[? "type"] == "Quest")
		{
			if(!ds_map_exists(objPlayer.playerQuests, questID))
			{
				ds_map_add(objPlayer.playerQuests, questID, 0)
				makePopUp("Quests", quest[? "name"], true);
			}
		}
	
		else if(quest[? "type"] == "Bounties")
		{
			if(!ds_map_exists(objPlayer.playerBounties, questID))
			{
				ds_map_add(objPlayer.playerBounties, questID, 0)	
			}
		}
	
		else show_debug_message(questID + " is not a quest or bounty");
	}
	
	else show_debug_message(questID + " returned an undefiend quest/bounty")
	
}