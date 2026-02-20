// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function craftItem(sendBack)
{
	objChoicePanel.crafting = 3;
	var rarityAry = grabRarityMaterials(objGameController.location[? "maxRarity"]);
	objGameController.mainText = objGameController.location[? "craftMessage"];
		
	
	for(var i = 0; i < array_length(rarityAry); i++)
	{
		objGameController.actionsArray[i] = rarityAry[i];
	}
}