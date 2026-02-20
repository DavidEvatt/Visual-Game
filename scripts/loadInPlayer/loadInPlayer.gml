// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadInPlayer()
{
	var fileLocation = working_directory + "PlayerData/playerSave.json"
    
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
		
		
		objTDPlayer.Name = allData[? "name"];
		objTDPlayer.month = allData[? "month"];
		objTDPlayer.time = allData[? "time"];
		objTDPlayer.day = allData[? "day"];

		objTDPlayer.hp = allData[? "hp"];
		objTDPlayer.maxHp = allData[? "maxHp"];
		objTDPlayer.str = allData[? "strength"];
		objTDPlayer.dex = allData[? "dexterity"];
		objTDPlayer.mind = allData[? "mind"];
		objTDPlayer.luck = allData[? "luck"];

		objTDPlayer.level = allData[? "level"];
		objTDPlayer.xp = allData[? "xp"];
		objTDPlayer.xpToNext = allData[? "xpToNextLevel"];
		
		objTDPlayer.mana = 10 * objTDPlayer.mind;
		objTDPlayer.maxMana = objTDPlayer.mana;
		
		increaseInventory("lessHealth", 5);
		increaseInventory("lessMana", 5);
	}
	
	var fileLocationAttacks = working_directory + "PlayerData/currentCombat.json";
	if(file_exists(fileLocationAttacks))
	{
		var json = "";
		var file = file_text_open_read(fileLocationAttacks);
		
		while(!file_text_eof(file))
		{
			json += file_text_readln(file);	
		}
		
		file_text_close(file);
		var allData = json_decode(json);
		var attacks = ds_map_find_value(allData, "Attacks");
		
		
		if (!is_undefined(attacks) && ds_exists(attacks, ds_type_list))
		{
		    for (var i = 0; i < ds_list_size(attacks); i++)
		    {
		        var attackData = attacks[| i];

		        if(i >= 0 && i < 4)
				{
					objTDPlayer.attacks[i] = attackData[? "ID"]; 
				}
				
				else if(i >= 4 && i < 8)
				{
					objTDPlayer.mAttacks[i - 4] = attackData [? "ID"];
				}
				
				else if(i >= 8 && i < 12)
				{
					objTDPlayer.potions[i - 8] = attackData [? "ID"];
				}
				else
				{
					objTDPlayer.weapon = attackData [? "ID"];
				}
		    }
		}
		else
		{
			    show_debug_message("ERROR: Attacks is not a ds_list");
		}
	}	

	loadPlayerWeapons();
	loadPlayerInventory();
	loadPlayerQuestBounties();
	loadPlayerMoveKnowledge();
	loadPlayerPotionKnowledge();
	
	room_goto_next();
}