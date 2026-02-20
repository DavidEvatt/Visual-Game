// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sellItems()
{
	var materialType = grabTypeMaterials(objGameController.location[? "sellType"], objGameController.location[? "secondarySellType"], objGameController.location[? "region"]);
	objGameController.mainText = objGameController.location[? "sellMessage"];
		
	
	for(var i = 0; i < array_length(materialType); i++)
	{
		objGameController.actionsArray[i] = materialType[i];
	}
}