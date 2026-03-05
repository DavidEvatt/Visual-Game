// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tossACoin()
{
	var chance = irandom(100) - objPlayer.luck;
	//update the world State
	
	if(chance > 5)
	{
		objPopup.xPos = irandom_range(200, 800);
		objPopup.yPos = irandom_range(200, 600);
		
		objPopup.popText = "Nothing Happend";
		objPopup.currentState = POPSTATE.VISIBLE;
		objPopup.curTimer = objPopup.maxVisibleTimer;
	}
	
	else if(chance <= 5 && chance >= 1)
	{
		show_debug_message("5%")
		var stat = irandom(4) + 1;
		
		switch (stat)
		{
			case 1:
			{
				increaseStat("health");
				objPopup.xPos = irandom_range(200, 800);
				objPopup.yPos = irandom_range(200, 600);
				objPopup.popText = "Health Increased"; 
				break;
			}
			
			case 2: 
			{
				increaseStat("strength"); 
				objPopup.xPos = irandom_range(200, 800);
				objPopup.yPos = irandom_range(200, 600);
				objPopup.popText = "Strength Increased"; 
				break;
			}
			
			case 3: 
			{
				increaseStat("dexterity"); 
				objPopup.xPos = irandom_range(200, 800);
				objPopup.yPos = irandom_range(200, 600);
				objPopup.popText = "Dexterity Increased"; 
				break;
			}
			
			case 4:
			{
				increaseStat("mind");
				objPopup.xPos = irandom_range(200, 800);
				objPopup.yPos = irandom_range(200, 600);
				objPopup.popText = "Mind Increased";
				break;
			}
			
			case 5: 
			{
				increaseStat("luck");
				objPopup.xPos = irandom_range(200, 800);
				objPopup.yPos = irandom_range(200, 600);
				objPopup.popText = "Luck Increased"; 
				break;
			}
		}
		
		objPopup.currentState = POPSTATE.VISIBLE;
		objPopup.curTimer = objPopup.maxVisibleTimer;
	}
	
	else
	{
		increaseAllStats(1, 1, 1, 1, 1);
		objPopup.xPos = irandom_range(200, 800);
		objPopup.yPos = irandom_range(200, 600);
		objPopup.popText = "Everything Increased"; 
		objPopup.currentState = POPSTATE.VISIBLE;
		objPopup.curTimer = objPopup.maxVisibleTimer;
	}
	
	
}