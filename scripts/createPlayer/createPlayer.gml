// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createPlayer()
{
	ds_list_clear(objPlayer.keyItems);
	ds_list_clear(objPlayer.knownAttacks);
	ds_list_clear(objPlayer.knownPotions);
	ds_list_clear(objPlayer.obtainedWeapons);
	ds_map_clear(objPlayer.potionInventory);
	ds_map_clear(objPlayer.playerBounties);
	ds_map_clear(objPlayer.playerQuests);
	
	ds_list_add(objPlayer.knownAttacks, "normal");
	ds_list_add(objPlayer.knownAttacks, "magicPunch");
	
	ds_list_add(objPlayer.obtainedWeapons, "fist")
	
	
	var combatKnow = file_text_open_write(working_directory + "PlayerData/combatKnowledge.json"); // Opens the file, erasing previous contents
	var curCombat = file_text_open_write(working_directory + "PlayerData/currentCombat.json"); // Opens the file, erasing previous contents
	var cusCombat = file_text_open_write(working_directory + "PlayerData/customCombat.json"); // Opens the file, erasing previous contents
	var inventory = file_text_open_write(working_directory + "PlayerData/inventory.json"); // Opens the file, erasing previous contents
	var obtainedWeapons = file_text_open_write(working_directory + "PlayerData/obtainedWeapons.json"); // Opens the file, erasing previous contents
	var playerSave = file_text_open_write(working_directory + "PlayerData/playerSave.json"); // Opens the file, erasing previous contents
	var potionKnowledge = file_text_open_write(working_directory + "PlayerData/potionKnowledge.json"); // Opens the file, erasing previous contents
	var questSaves = file_text_open_write(working_directory + "PlayerData/questsSave.json"); // Opens the file, erasing previous contents
	
	file_text_close(combatKnow);
	file_text_close(curCombat);
	file_text_close(cusCombat);
	file_text_close(inventory);
	file_text_close(obtainedWeapons);
	file_text_close(playerSave);
	file_text_close(potionKnowledge);
	file_text_close(questSaves);

}