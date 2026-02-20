nameText = "Enter your name: " 
currentState = MAINAREA.GAMESTART;
positionVarb = 0;
//0 = HP, 1 = STR, 2 = DEX, 3 = MIND

enum MAINAREA
{
	GAMESTART,
	BEGINNING,
	NAMING,
	MONTHSELECT,
	TIMESELECT,
	DAYSELECT,
	
	JSON,
	COMBAT,
	LEVELUP,
	COMBATDEATH,
	
	NEEDSPAUSE
}



buttonsMade = false;
healthButton = noone;
strengthButton = noone;
dexterityButton = noone;
mindButton = noone;

dayButton = false;
daySelector = noone;


combatText = "";
mindState = "";
combatDeathtext = "it Died";