// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabRandomEnemy(playerLevel, tieredEnemies)
{	
	var determinedEnemy = undefined;
    var enemySelected = false;
    
    // Example rarity thresholds per level (replace with your data)
    // Each subarray = [tier0Chance, tier1Chance, tier2Chance, tier3Chance, tier4Chance]
	var key = string(playerLevel);
   
	if (!ds_map_exists(objGameController.enemyGen, key))
	{
	    key = "5";
	}
	
	 var rarityChances = objGameController.enemyGen[? key];
    // e.g., rarityChances = [50, 30, 15, 4, 1]
	
	while (!enemySelected) 
	{
	    var rarityRoll = irandom(99) + 1; // 1 to 100

	    for (var i = 0; i < 5; i++) 
		{
	        var tierKey = string(i + 1);
	        if (!ds_map_exists(tieredEnemies, tierKey)) continue;

	        var tierMap = tieredEnemies[? tierKey];
	        var enemyKeys = ds_map_keys_to_array(tierMap);
	        if (array_length(enemyKeys) == 0) continue;

	        if (rarityRoll >= rarityChances[i])
			{
	            var randomIndex = irandom(array_length(enemyKeys) - 1);
	            determinedEnemy = tierMap[? enemyKeys[randomIndex]];
	            enemySelected = true;
	            break;
	        }
	    }
	    
	}
	
    return generateEnemy(determinedEnemy);
}