// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveCustomWeapons(customWeapon)
{
	var location = working_directory + "PlayerData/customCombat.json";
	var weaponStruct;
    var reader;
    var weaponArray = [];

    // 1. Load existing JSON if it exists
    if (file_exists(location))
    {
		
        var json = "";
        var file = file_text_open_read(location);
        while (!file_text_eof(file)) json += file_text_readln(file);
        file_text_close(file);

        reader = json_decode(json);

        // Use existing array if it exists, otherwise create a new one
        
		var weapons = ds_map_find_value(reader, "Weapons");
		
		if(!is_undefined(weapons))
		{
			for(var i = 0; i < ds_list_size(weapons); i++)
			{
				var whatAreYou = weapons[| i];
				weaponStruct = 
				{
					ID   : whatAreYou[? "ID"],
					Name : whatAreYou[? "Name"],
					type :  whatAreYou[? "type"],
					baseDmg :  whatAreYou[? "baseDmg"],
					baseMDmg : 0,
					baseHealth : 0,
					baseMana : 0,
					desc : whatAreYou[? "desc"]
				};
				
				var effectsArray = [];
				
				for(var j = 0; j < ds_list_size(whatAreYou[? "Added Effects"]); j++)
				{
					var effectMap = ds_list_find_value(whatAreYou[? "Added Effects"], i);
					var effectStruct = mapToStruct(effectMap);
					array_push(effectsArray, effectStruct);
				}
			
				var colorArray = [];
			
				for(var j = 0; j < ds_list_size(whatAreYou[? "Part Colors"]); j++)
				{
					var rgbValMap = ds_list_find_value(whatAreYou[? "Part Colors"], i);
					var rgbStruct = mapToStruct(rgbValMap);
					array_push(colorArray, rgbStruct);
				}
						
				weaponStruct[$ "Added Effects"] = effectsArray;
				weaponStruct[$ "Part Colors"] = colorArray;
				
				array_push(weaponArray, weaponStruct);
			
			}
		}
        
    }

    // 2. Append the new weapon
    array_push(weaponArray, customWeapon);

    // 3. Save back to the map
    var saveData = {
		Weapons : weaponArray
	};

	var jsonString = json_stringify(saveData, true);
	var file = file_text_open_write(location);
	file_text_write_string(file, jsonString);
	file_text_close(file);

}


