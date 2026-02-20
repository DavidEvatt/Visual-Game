if(room != Room1)
{
	objMainText.image_alpha = 0;
	objChoicePanel.image_alpha = 0;
	objInventoryQuestPanel.image_alpha = 0;

}

if(objMainText.currentState == MAINAREA.NAMING && objChoicePanel.currentState != CHOICESTATE.NAMING)
{
	objChoicePanel.currentState = CHOICESTATE.NAMING
}

if(room == Room2 && !gotWalls)
{
	needsWalls = true;	
}

if(needsWalls && !gotWalls)
{
	mp_grid_add_instances(worldMap, objWall, true)
	mp_grid_add_instances(townMap, objNPCWall, true)
	gotWalls = true
}
