// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function performActions(actionName, position)
{	
	show_debug_message(actionName + " | " + position);
	
	if (string_pos(".json", actionName) > 0)
    {
		objGameController.currentNode = actionName;
		loadFromJson(actionName);
        return;
    }
	
	else
	{

    // Action targets
	    switch (actionName)
	    {
			case "saveQuit":
			{
				Save();
				break;
			}
			
	        case "openShop":
			{
	            openShop(position);
	            break;
			}
			
			case "buyItems":
			{
				buyItems(position, objGameController.actionsArray[objChoicePanel.currentOption][? "Cost"], objGameController.actionsArray[objChoicePanel.currentOption][? "ID"]);
				break;
			}
			
			case "craftItems":
			{
				craftItem(position);
				break;	
			}
			
			case "sellItems":
			{
				sellItems();
				break;
			}
			
			case "hearRumor":
			{
				addQuest("lightningRabbit");
				loadFromJson(position);
				break;	
			}
			
			case "giveItem":
			{
				var item = objGameController.actionsArray[currentOption][? "itemID"];
				var quest = objGameController.actionsArray[currentOption][? "questID"]
				giveItem(item, quest);
				break;	
			}
			
			case "wellTalk":
			{
				var wellAry = objGameController.location[? "WellMessages"];
				var randomIndex = irandom(ds_list_size(wellAry) -1);
				
				var wellMessage = ds_list_find_value(wellAry, randomIndex)[? "message"];
				
				if(string_pos("forever", string_lower(wellMessage)) > 0)
				{
					show_debug_message("It exists");
					addQuest("bottomOfTheWell");
				}
				
				objGameController.mainText = wellMessage;
				objMainText.currentState = MAINAREA.NEEDSPAUSE;
				objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				
				break;	
			}
			
			case "swimming":
			{
				if(ElderwellActions.wellSwimCount < ElderwellActions.reachingWellSwim)
				{
					if(objPlayer.hp > ElderwellActions.wellSwimCount)
					{
						objPlayer.hp -= ElderwellActions.wellSwimCount;
						ElderwellActions.wellSwimCount++
						
						loadFromJson(objGameController.currentNode);
					}
					
					else
					{
						objGameController.mainText = "As you start to drown you float to the top of the well!"
						objGameController.currentNode = "Eldaria/towncenter.json"
						
						objMainText.currentState = MAINAREA.NEEDSPAUSE;
						objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
					}
				}
				
				else
				{
					loadFromJson("ElderwellWell/underTheWell.json");	
				}
				
				
				break;	
			}
			
			case "seduceDoor":
			{
				var chance = irandom(100) + 1;
				if(chance != 1)
				{
					var seduceAry = objGameController.location[? "SeduceMessages"];
					var randomIndex = irandom(ds_list_size(seduceAry) -1);
				
					var wellMessage = ds_list_find_value(seduceAry, randomIndex)[? "message"];
				
					objGameController.mainText = wellMessage;
					objGameController.currentNode = "ElderwellWell/underTheWell.json"
				}
				
				else
				{
					objGameController.mainText = "To your surprise the door actually opens itself";
					objGameController.currentNode = "WellDungeon/wellDungeonStart.json"
				}
				
				objMainText.currentState = MAINAREA.NEEDSPAUSE;
				objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				
				break;		
			}
			
			case "wellKey":
			{
				var hasKey = false;
				for(var i = 0; i < ds_list_size(objPlayer.keyItems); i++)
				{
					var curItem = ds_list_find_value(objPlayer.keyItems, i);
					
					if(string_pos("oddKey", curItem) > 0 && !hasKey)
					{
						hasKey = true;
					}
				}
				
				if(hasKey)
				{
					objGameController.currentNode = "WellDungeon/wellDungeonStart.json"
					loadFromJson(objGameController.currentNode);
				}
				
				else 
				{
					if(hasQuest("bottomOfTheWell"))
					{
						var questIndex = ds_map_find_value(objPlayer.playerQuests, "bottomOfTheWell");
						ds_map_replace(objPlayer.playerQuests, "bottomOfTheWell", questIndex + 1);
					}
					
					objGameController.mainText = "The door wont budge without the key";
					objGameController.currentNode = "ElderwellWell/underTheWell.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
				break;	
			}
			
			case "keyAsk":
			{
				var hasKey = false;
				for(var i = 0; i < ds_list_size(objPlayer.keyItems); i++)
				{
					var curItem = ds_list_find_value(objPlayer.keyItems, i);
					
					if(string_pos("oddKey", curItem) > 0 && !hasKey)
					{
						hasKey = true;
					}
				}
				
				if(hasKey)
				{
					objGameController.mainText = "I already gave you the damn key!";
					objGameController.currentNode = "EldariaNight/tavern.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
				
				else
				{
					objGameController.mainText = "Good luck with this odd key. I couldn't find a place for it.";
					
					ds_list_add(objPlayer.keyItems, "oddKey");
					objGameController.currentNode = "EldariaNight/tavern.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
				break;	
			}
			
			case "lookAtOakheartsBrew":
			{
				if(!hasQuest("unstablePotion"))
				{
					addQuest("unstablePotion");
					
					objGameController.mainText = "A small black potion with bubbles floating up marked \"UNSTABLE\" catches your eye.";
					objGameController.currentNode = "Eldaria/Shops/potionShop.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
				
				else
				{
					objGameController.mainText = "You notice that the shop is cleaned with much attention to detail.\nEverything has its own spot.";
					objGameController.currentNode = "Eldaria/Shops/potionShop.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
					
				break;
			}
			
			case "unstablePotion":
			{
				if(hasQuest("unstablePotion"))
				{
					var questIndex = ds_map_find_value(objPlayer.playerQuests, "unstablePotion");
					ds_map_replace(objPlayer.playerQuests, "unstablePotion", questIndex + 1);
					
					objPlayer.storeHP = objPlayer.hp;
					objPlayer.storeMaxHp = objPlayer.maxHp;
					objPlayer.storeStr = objPlayer.str;
					objPlayer.storeDex = objPlayer.dex;
					objPlayer.storeMind = objPlayer.mind;
					objPlayer.storeLuck = objPlayer.luck;
					
					objPlayer.hp = 1;
					objPlayer.maxHp = 1;
					objPlayer.str = 1;
					objPlayer.dex = 1;
					objPlayer.mind = 1;
					objPlayer.luck = 1;
					
					objGameController.mainText = "\"IDIOT! I HAVE NO IDEA WHAT THAT DOES!\nYou're gonna want to try and sleep that off before leaving.\"";
					objGameController.currentNode = "Eldaria/Shops/potionShop.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				}
				break;
			}
			
			case "potionDemand":
			{
				completeQuest("unstablePotion")
				objGameController.mainText = "\"It was a potion I've been working on. Here is another one for you to try.\nThanks to you they are ready to be sold\"";
				objGameController.currentNode = "Eldaria/Shops/potionShop.json"
				objMainText.currentState = MAINAREA.NEEDSPAUSE;
				objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				break;
			}
			
			case "viewReputation":
			{
				var repMessage = "";
				if(objGameController.curRegion.reputation > 0)
				{
					if(objGameController.curRegion.reputation >= 100)
					{
						repMessage = "The town couldn't respect you any more than they do.\nYou are well known and well liked.\nMany things are open to you.";
					}
					
					else if(objGameController.curRegion.reputation < 100 && objGameController.curRegion.reputation >= 75)
					{
						repMessage = "The town knows you and is starting to love you.\nSome things might start opening up";
					}
					
					else if(objGameController.curRegion.reputation < 75 && objGameController.curRegion.reputation >= 50)
					{
						repMessage = "Your name is starting to become known.\nAnd the people are starting to like you";
					}
					
					else if(objGameController.curRegion.reputation < 50 && objGameController.curRegion.reputation >= 25)
					{
						repMessage = "People are starting to notice you in the streets";
					}
					
					else
					{
						repMessage = "You are considered just another passsing traveler."	
					}
				}
				
				else
				{
					if(objGameController.curRegion.reputation >= -25)
					{
						repMessage = "You are considered just another passsing traveler."	
					}
					
					else if(objGameController.curRegion.reputation < -25 && objGameController.curRegion.reputation >= -50)
					{
						repMessage = "People notice you in the streets and tend to move away from you."
					}
					
					else if(objGameController.curRegion.reputation < -50 && objGameController.curRegion.reputation >= -75)
					{
						repMessage = "Your name is becoming known.\nPeople are starting to avoid you."
					}
					
					else if(objGameController.curRegion.reputation < -75 && objGameController.curRegion.reputation >= -100)
					{
						repMessage = "The town knows who you are.\nYou might notice options missing.";
					}
					
					else
					{
						repMessage = "The town always seems like a ghost town when you step inside.\nShops and streets empty";
					}
				}
				
				objGameController.mainText = repMessage;
				objGameController.currentNode = "Eldaria/Shops/guildcenter.json"
				objMainText.currentState = MAINAREA.NEEDSPAUSE;
				objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
				break;
			}
			
			case "viewBounties":
			{
				openBounties();
				break;	
			}
			
			case "collectBounty":
			{
				openRegionalBounties();
				break;
			}
			
			case "buyRoom":
			{
				if(objPlayer.coins >= 20)
				{
					if(hasQuest("unstablePotion") && ds_map_find_value(objPlayer.playerQuests, "unstablePotion") == 1)
					{
						objPlayer.hp = objPlayer.storeHP;
						objPlayer.maxHp = objPlayer.storeMaxHp ;
						objPlayer.str = objPlayer.storeStr;
						objPlayer.dex = objPlayer.storeDex;
						objPlayer.mind = objPlayer.storeMind;
						objPlayer.luck = objPlayer.storeLuck;
						
						var questIndex = ds_map_find_value(objPlayer.playerQuests, "unstablePotion");
						ds_map_replace(objPlayer.playerQuests, "unstablePotion", questIndex + 1);
						
						objGameController.mainText = "You feel well rested and feel your body turn back to normal.";
						objPlayer.hp = objPlayer.maxHp;
						objGameController.currentNode = "Eldaria/town.json"
						objMainText.currentState = MAINAREA.NEEDSPAUSE;
						objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
					}
					
					else
					{
						objGameController.mainText = "You feel well rested";
						objPlayer.hp = objPlayer.maxHp;
						objGameController.currentNode = "Eldaria/town.json"
						objMainText.currentState = MAINAREA.NEEDSPAUSE;
						objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;
					}
				}
				
				else
				{
					objGameController.mainText = "You don't have enough money for a room";
					objGameController.currentNode = "EldariaNight/tavern.json"
					objMainText.currentState = MAINAREA.NEEDSPAUSE;
					objChoicePanel.currentState = CHOICESTATE.NEEDSPAUSE;	
				}
				break;	
			}
			
			case "leave":
			{
				leaveTown();
				break;
			}

	        default:
	            show_debug_message("Unknown target: " + target);
	    }
	}
}