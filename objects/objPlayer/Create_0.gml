hp = 1;
maxHp = 1;

str = 30;
dex = 30;
mind = 30;
luck = 5;

mana = 1;
maxMana = 1;

xp = 1;
xpToNext = 1;

storeHP = 0;
storeMaxHp = 0;
storeStr = 0;
storeDex = 0;
storeMind = 0;
storeLuck = 0;

varDisplaySpd = 0.03;

hpDisplay = hp;
manaDisplay = mana;
xpDisplay = xp;


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

attacks[0] = "normal";
attacks[2] = "none";
attacks[1] = "none";
attacks[3] = "none";

mAttacks[0] = "magicPunch";
mAttacks[1] = "none";
mAttacks[2] = "none";
mAttacks[3] = "none";

potions[0] = "none"
potions[1] = "none"
potions[2] = "none"
potions[3] = "none"

weapon = "fist"

keyItems = ds_list_create();

potionInventory = ds_map_create();

materialInventory = ds_map_create();
initializeInventory();

shield = false;
curShieldDur = 0;
maxShieldDur = 2;

knownAttacks = ds_list_create();
knownPotions = ds_list_create();
obtainedWeapons = ds_list_create();


playerBounties = ds_map_create();
playerQuests = ds_map_create();

weaponColor[0] = c_white;
weaponColor[1] = c_white;
weaponColor[2] = c_white;

//moving it in the screen
moveSpd = 2;
right = true;

grv = 0.5;
vSpeed = 0;

curretState = PLAYERSTATE.MOVE
enum PLAYERSTATE
{
	ATTACK,
	MOVE,
	COMBO
}

createAtk = false;