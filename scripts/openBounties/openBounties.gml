// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function openBounties()
{
	objGameController.actionsArray = [];
	objGameController.mainText = "Pick any of them";
	
	show_debug_message(string(array_length(objGameController.curRegion.regionalBounties)))
	
	for(var i = 0; i < array_length(objGameController.curRegion.regionalBounties); i++)
	{
		objGameController.actionsArray[i] = objGameController.curRegion.regionalBounties[i];
		//show_debug_message(objGameController.curRegion.regionalBounties[i][? "id"])
		//show_debug_message("this is being ran")
	}
}