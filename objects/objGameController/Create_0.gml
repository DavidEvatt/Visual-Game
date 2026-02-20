/// objGameController Create Event
worldMap = mp_grid_create(0, 0, 4800/32, 4800/32, 32, 32);
mp_grid_add_instances(worldMap, objWall, true)
needsWalls = false
gotWalls = false

townMap = mp_grid_create(0, 0, 4800/16, 4800/16, 16, 16);
mp_grid_add_instances(townMap, objNPCWall, true)

glitched = true;
var dt = date_current_datetime();
var seed = date_get_year(dt)*10000000000 + date_get_month(dt)*100000000
         + date_get_day(dt)*1000000 + date_get_hour(dt)*10000
         + date_get_minute(dt)*100 + date_get_second(dt);

random_set_seed(seed);
// --- Variables ---
location = undefined;
mainText = "";
actionsArray = [];

currentNode = "Eldaria/town.json"; // just the file name
previousNode = "Eldaria/town.json";

// --- Function to Load JSON Node ---


region = "ElderwellForest";


regionMap = ds_map_create();
ds_map_add(regionMap, "Elderwell", instance_create_layer(x, y, "GameController", ElderwellActions));
ds_map_add(regionMap, "Springviel", instance_create_layer(x, y, "GameController", SpringvielActions));


curRegion = ds_map_find_value(regionMap, "Springviel");

//craeting the list of attaks

craftedItem = undefined;

curEnemy = noone;
gameStart = false;
characterExists = false;

//creating the enemy database
tieredEnemies = ds_map_create()
loadInEnemies("Enemies.json", region)

enemyGen = ds_map_create();
enemyGen[? "1"] = [50, 10, 5, 1, 0];
enemyGen[? "2"] = [75, 15, 5, 2, 0];
enemyGen[? "3"] = [95, 80, 20, 5, 0];
enemyGen[? "4"] = [98, 95, 85, 25, 0];
enemyGen[? "5"] = [98, 95, 90, 50, 0];

//creating data bases to pull from
craftingColors = ds_map_create();
craftingMaterials = [];
loadInCrafting("craftingMaterials.json");

potionDatabase = [];
loadInPotions("potions.json");

attackList = [];
loadInAttacks("attacks.json");

weaponList = [];
loadInWeapons("weapons.json");



allQuests = [];
allBounties = [];
loadInQuests();

//player creation
statAllocationPoints = 20;

loadFromJson(currentNode)
