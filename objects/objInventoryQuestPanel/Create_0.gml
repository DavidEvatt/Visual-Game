curretState = IQPANELSTATE.INVENTORY;
currentSelector = SELECTOR.NONE;

enum IQPANELSTATE
{
	INVENTORY,
	QUEST,
	ATTACKS,
	EQUIPMENT
}

enum SELECTOR
{
	NONE,
	ATTACK,
	MAGIC,
	POTION
}

selectorY = 300;
selctorSpacing = 15;
yStart = 285;
spacing = 30;

hovered = -1;

panelOptions[0] = "Inventory";
panelOptions[1] = "Quests";
panelOptions[2] = "Attacks";
panelOptions[3] = "Equipment";


selctorPannelOption[0] = "Attacks";
selctorPannelOption[1] = "Magics"
selctorPannelOption[2] = "Potions"

selectorOption = 0;

currentOption = 0;

drawIndex = 1;

needsUI = true;

attackKeys = undefined
potionKeys = undefined

showInventory = false;
drawWeaponSpacing = 48 * 2;

itemXYBounds[0][0] = 738;
itemXYBounds[0][1] = 225;

weaponRows = 0;
weaponCollumns = 0;
trackRows = 0;
trackCol = 0;

weaponInventory[0][0] = undefined
weaponInventory[1][0] = undefined
weaponInventory[2][0] = undefined
weaponInventory[3][0] = undefined
weaponInventory[4][0] = undefined

weaponInventory[0][1] = undefined
weaponInventory[1][1] = undefined
weaponInventory[2][1] = undefined
weaponInventory[3][1] = undefined
weaponInventory[4][1] = undefined

weaponInventory[0][2] = undefined
weaponInventory[1][2] = undefined
weaponInventory[2][2] = undefined
weaponInventory[3][2] = undefined
weaponInventory[4][2] = undefined

weaponInventory[0][3] = undefined
weaponInventory[1][3] = undefined
weaponInventory[2][3] = undefined
weaponInventory[3][3] = undefined
weaponInventory[4][3] = undefined




