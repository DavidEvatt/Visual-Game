// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grabPotion(idToGrab){
	var returnType = undefined;
	
	for (var i = 0; i < array_length(objGameController.potionDatabase); i++) 
	{
	    if (objGameController.potionDatabase[i][? "ID"] == idToGrab) 
		{
	        returnType =  objGameController.potionDatabase[i];
	    }
	}
	
	if(returnType == undefined)
	{
		show_debug_message(idToGrab + " Not in database!");
	}
	
	return returnType;
}