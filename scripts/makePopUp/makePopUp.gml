// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makePopUp(text, type, qb)
{
	if(qb == true)
	{
		if(objPopup.currentState != POPSTATE.VISIBLE && objPopup.curTimer <= 0)
		{
			objPopup.popText = text + " obtained: " + type;
			objPopup.curTimer = objPopup.maxVisibleTimer
			objPopup.currentState = POPSTATE.VISIBLE;
		}
	}
}