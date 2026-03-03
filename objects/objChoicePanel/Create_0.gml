combatChoices[0] = "Attack"
combatChoices[1] = "Magic"
combatChoices[2] = "Potion"
combatChoices[3] = "Run"

combatQueue = ds_list_create();
combatTimer = 0;
combatDelay = 80;

gameStart[0] = "New Game";
gameStart[1] = "Load";
gameStart[2] = "Quit";

monthSelect[0] = "Verdanturn";
monthSelect[1] = "Ironwake";
monthSelect[2] = "Skyrun";
monthSelect[3] = "Aetherfall";
monthSelect[4] = "Omenrest";

craftingIndex[0] = -1;
craftingIndex[1] = -1;
craftingIndex[2] = -1;
selectedMaterial[0] = undefined;
selectedMaterial[1] = undefined;
selectedMaterial[2] = undefined;
namingWeapon = false;
timeToBuy = false;

needsBackAdded = true;
needsSellButton = false;
sellPrice = 0;
sellButton = noone;

weaponEffectArray = ds_list_create();
weaponName = "";
cost = 0;
			
crafting = 3;

currentOption = 0;
columns = 0;

rounds = 0;

currentState = CHOICESTATE.GAMESTART;

inputNumber = 0;
inputValue = 0;

dmgNumber = 0;
eDmgNumber = 0;

leveled = false;

tempPlayerName = "";
maxCharacters = 12;

enum CHOICESTATE
{
	GAMESTART,
	JSON,
	
	CREATION,
	NAMING,
	MONTHSELECTION,
	TIMESELECTION,
	DAYSELECTION,
	LEVELUP,
	
	COMBATCHOICE,
	ATTACK,
	MAGIC,
	POTION,
	COMBATDEATH,
	EVALUATECOMBAT,
	
	NEEDSPAUSE,
	
	
	
	NPCTALK
}

needsText = true;
mainMessage = "";
charCount = 0;
typeSpd = 0.4; // Characters per frame

