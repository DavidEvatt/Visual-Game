// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function levelUp()
{
	objChoicePanel.leveled = true;
	
	if(objPlayer.xp >= objPlayer.xpToNext)
	{
		objChoicePanel.leveled = true;
		objPlayer.xp -= objPlayer.xpToNext;
		objPlayer.xpToNext *= 1.5;
		objPlayer.level++;
		
		//things to level up
		objGameController.statAllocationPoints = floor(objPlayer.level / 5) + 4;
		objGameController.characterExists = false;
		objMainText.buttonsMade = false;
		
		objMainText.currentState = MAINAREA.LEVELUP;
		objChoicePanel.currentState = CHOICESTATE.LEVELUP;
	}
	
	else
	{
		objChoicePanel.leveled = false;
	}
}