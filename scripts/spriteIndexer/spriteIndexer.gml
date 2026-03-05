// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spriteIndexer()
{
	switch(enemyType)
	{
		case "Slime":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprSlime1; break;
				//case 2:	sprite_index = sprSlime2; break;
			}
		
			break;	
		}
		
		case "Squirrel":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprSquirell1; break;
			}
		
			break;
		}
	
		case "Rabbit":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprBunny1; break;
			}
		
			break;
		}
	
		case "Wolf":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprWolf1; break;
			}
		
			break;
		}
	
		case "Boar":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprBoar1; break;
			}
		
			break;
		}
		
		case "Lightning Rabbit":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprLightningBunny1; break;
			}
		
			break;
		}
		
		case "Stump Golem":
		{
			var index = irandom(0) + 1;
		
			switch(index)
			{
				case 1:	sprite_index = sprStumpG1; break;
			}
		
			break;
		}
	}

	
	
}