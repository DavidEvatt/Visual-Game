// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initializeInventory()
{
	for(var i = 0; i < array_length(objGameController.craftingMaterials); i++)
	{
		ds_map_add(materialInventory, objGameController.craftingMaterials[i][? "ID"], 0);
	}
	
	for(var i = 0; i < array_length(objGameController.potionDatabase); i++)
	{
		ds_map_add(potionInventory, objGameController.potionDatabase[i][? "ID"], 1);
	}
}

