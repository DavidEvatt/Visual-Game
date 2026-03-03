//Stat variables
hp = 10;
maxHp = 10;

str = 5;
dex = 5;
mind = 5;
luck = 1;
moveSpd = 2;

mana = 1;
maxMana = 1;

xp = 0;
xpToNext = 45;

storeHP = 0;
storeMaxHp = 0;
storeStr = 0;
storeDex = 0;
storeMind = 0;
storeLuck = 0;

iframes = 0;
maxIframes = 60;

varDisplaySpd = 0.03;

hpDisplay = hp;
manaDisplay = mana;
xpDisplay = xp;

knockBackDis = 4;
comboknockBackDis = 7;

level = 1;

Name = "Tarvaneil"
month = "Felixmen"
time = "Day"
day = 15

coins = 500000

frozen = false;
bound = false; 

physicalRes = 0;
magicalRes = 0;

//Inventory Varbs
weapon = "fist"

keyItems = ds_list_create();

potionInventory = ds_map_create();

materialInventory = ds_map_create();
initializeInventory();

shield = false;

knownAttacks = ds_list_create();
knownPotions = ds_list_create();
obtainedWeapons = ds_list_create();

playerBounties = ds_map_create();
playerQuests = ds_map_create();

hsp = 0;
vsp = 0;

//we are going to do away with this but need it for saving

attacks[0] = "normal";
attacks[2] = "none";
attacks[1] = "none";
attacks[3] = "none";

mAttacks[0] = "magicPunch";
mAttacks[1] = "none";
mAttacks[2] = "none";
mAttacks[3] = "fireBall";

potions[0] = "none"
potions[1] = "none"
potions[2] = "none"
potions[3] = "none"

equipedItems[0] = "lessHealth";
equipedItems[1] = "lessMana";
equipedItems[2] = "unstabPot";


keyRight = 0;
keyLeft = 0;
keyUp = 0;
keyDown = 0;
keyAttack = 0;
keySpace = 0;
	
depth = 1;

moveH  = 0;
moveV  = 0;

currentState = PLAYERSTATE.MOVE;

//attack features
queCombo = false;
crit = false;

//color and animation
dir = "DOWN";

colorChange = 0;

playerColors[0] = make_color_rgb(255, 207, 159)	//Skin
playerColors[1] = make_color_rgb(223, 199, 135) //Horn 
playerColors[2] = make_color_rgb(223, 199, 135) //Hoof
playerColors[3] = make_color_rgb(103, 29, 7)	//Hair / Legs
playerColors[4] = make_color_rgb(103, 103, 23)	//Eyei
playerColors[5] = make_color_rgb(207, 55, 7)	//Body

weaponColor[0] = c_maroon;
weaponColor[1] = c_gray;
weaponColor[2] = c_yellow;
weaponColor[3] = c_white;

weaponType = "FIST"
startAtk = false;

atkCooldown = 15;
curatkCooldown = 0;
comboBuffer = 0;
maxComboBuffer = 0;


curHitStun = 0;
maxHitStun = 15;

movedRooms = false;
storeX = 0;
storeY = 0;

manaRegen = 0.009;

talkingToNpc = false;
talkingRange = 120;

//Reputation Values
reputationTable = ds_map_create();
loadInRepp();
reputation = 4;