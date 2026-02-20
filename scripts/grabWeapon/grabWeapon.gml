
function grabWeapon(idToGrab)
{
	var returnData = undefined
	for (var i = 0; i < array_length(objGameController.weaponList); i++) 
	{
	    if (objGameController.weaponList[i][? "ID"] == idToGrab) 
		{
	        returnData = objGameController.weaponList[i];
	    }
	}
	
	if(returnData == undefined)
	{
		show_debug_message("Not a weapon or not a valid ID")
	}
	
	return returnData;
}