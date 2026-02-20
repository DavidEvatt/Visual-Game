// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabMaterial(idToGrab)
{
	for (var i = 0; i < array_length(objGameController.craftingMaterials); i++) 
	{
	    if (objGameController.craftingMaterials[i][? "ID"] == idToGrab) 
		{
	        return objGameController.craftingMaterials[i];
	    }
	}
	
	return undefined;
}