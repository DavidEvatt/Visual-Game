// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save()
{
	//saving stats
	var saveData = {
	    name: objTDPlayer.Name,
	    month: objTDPlayer.month,
	    time: objTDPlayer.time,
	    day: objTDPlayer.day,

	    hp: objTDPlayer.hp,
	    maxHp: objTDPlayer.maxHp,

	    strength: objTDPlayer.str,
	    dexterity: objTDPlayer.dex,
	    mind: objTDPlayer.mind,
	    luck: objTDPlayer.luck,

	    level: objTDPlayer.level,
	    xp: objTDPlayer.xp,
	    xpToNextLevel: objTDPlayer.xpToNext
	};
	
	if (!directory_exists("PlayerData")) {
		directory_create("PlayerData");
	}

	var json = json_stringify(saveData);

	var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
	buffer_write(buffer, buffer_text, json);
	buffer_save(buffer, "PlayerData/playerSave.json");
	buffer_delete(buffer);
	
	var writeIndex = 0;
	
	
	//saving known attaks
	if(true)
	{
		var saveAttackKnowledge = [];
		writeIndex = 0;

		// From arrA
		for (var i = 0; i < ds_list_size(objTDPlayer.knownAttacks); i++)
		{
			saveAttackKnowledge[writeIndex++] = { ID: ds_list_find_value(objTDPlayer.knownAttacks, i)};
		}
		var knownAttacks = {
		
		    Attacks: saveAttackKnowledge
		};
	
		if (!directory_exists("PlayerData")) {
			directory_create("PlayerData");
		}

		json = json_stringify(knownAttacks);

		buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		buffer_write(buffer, buffer_text, json);
		buffer_save(buffer, "PlayerData/combatKnowledge.json");
		buffer_delete(buffer);
	}
	//weapon knowledge
	if(true)
	{
		var saveWeaponKnowledge = [];
		writeIndex = 0;

		// From arrA
		for (var i = 0; i < ds_list_size(objTDPlayer.obtainedWeapons); i++)
		{
		    saveWeaponKnowledge[writeIndex++] = { ID: ds_list_find_value(objTDPlayer.obtainedWeapons, i)};
		}
	
		var knownWeapons = {
		    Weapons: saveWeaponKnowledge
		};
	
		if (!directory_exists("PlayerData")) {
			directory_create("PlayerData");
		}

		json = json_stringify(knownWeapons);

		buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		buffer_write(buffer, buffer_text, json);
		buffer_save(buffer, "PlayerData/obtainedWeapons.json");
		buffer_delete(buffer);
	
	}
	//potion knowledge
	if(true)
	{
		var savePpotionKnowledge = [];
		writeIndex = 0;

		// From arrA
		for (var i = 0; i < ds_list_size(objTDPlayer.knownPotions); i++)
		{
		    savePpotionKnowledge[writeIndex++] = { ID: ds_list_find_value(objTDPlayer.knownPotions, i)};
		}
		var knownPotions = {
		    Attacks: savePpotionKnowledge
		};
	
		if (!directory_exists("PlayerData")) {
			directory_create("PlayerData");
		}

		json = json_stringify(knownPotions);

		buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		buffer_write(buffer, buffer_text, json);
		buffer_save(buffer, "PlayerData/potionKnowledge.json");
		buffer_delete(buffer);
	}
	//Combat Setup
	if(true)
	{
		var saveAttackArray = [];
		writeIndex = 0;

		// From arrA
		for (var i = 0; i < array_length(objTDPlayer.attacks); i++)
		{
		    saveAttackArray[writeIndex++] = { ID: objTDPlayer.attacks[i] };
		}

		// From arrB
		for (var i = 0; i < array_length(objTDPlayer.mAttacks); i++)
		{
		    saveAttackArray[writeIndex++] = { ID: objTDPlayer.mAttacks[i] };
		}

		// From arrC
		for (var i = 0; i < array_length(objTDPlayer.potions); i++)
		{
		    saveAttackArray[writeIndex++] = { ID: objTDPlayer.potions[i] };
		}

		// Weapon last
		saveAttackArray[writeIndex++] = { ID: objTDPlayer.weapon };
	
		var saveRoot = {
			Attacks: saveAttackArray
		};
	
		if (!directory_exists("PlayerData"))
		{
		    directory_create("PlayerData");
		}

		json = json_stringify(saveRoot);

		var file = file_text_open_write("PlayerData/currentCombat.json");
		file_text_write_string(file, json);
		file_text_close(file);
	}
	//Inventory save
	if(true)
	{
		var invMap = objTDPlayer.materialInventory;
		var invKeys = ds_map_keys_to_array(invMap);

		var inventoryArray = [];
		writeIndex = 0;

		for (var i = 0; i < array_length(invKeys); i++)
		{
		    var itemID = invKeys[i];
		    var amount = invMap[? itemID];

		    if (amount > 0) // skip empty entries
		    {
		        inventoryArray[writeIndex++] = {
		            ID: itemID,
		            amt: amount
		        };
		    }
		}
		
		var saveRoot = {
			Inventory: inventoryArray
		};
		if (!directory_exists("PlayerData"))
		{
		    directory_create("PlayerData");
		}

		json = json_stringify(saveRoot);

		var file = file_text_open_write("PlayerData/inventory.json");
		file_text_write_string(file, json);
		file_text_close(file);
	}
	//Quest progress save
	if(true)
	{
		saveQuestsBounties();
		
	}
	
	game_end(0);
}

//C:\Users\Evatt\AppData\Local\c__RPG\PlayerData
//If you need to mess with stats!