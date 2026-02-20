
	if(top)
	{
		if(objGameController.statAllocationPoints > 0)
		{
			objGameController.statAllocationPoints--;
			curentVal++;
		}
	}

	if(bottom)
	{
		if(curentVal > 0)
		{
			objGameController.statAllocationPoints++;
			curentVal--;
		}
	}
