// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generateEnemy(enemyData){
	var inst = instance_create_layer(objTDPlayer.x, objTDPlayer.y, "Walls", objEnemy);
	
	inst.enemyData = enemyData;
	inst.region = enemyData[? "Region"];
	inst.Name = enemyData[? "Name"];
	inst.enemyType = enemyData[? "EnemyType"];

	inst.physicalRes = enemyData[? "PhysicalRes"];
	inst.magicalRes = enemyData[? "MagicalRes"];

	inst.boss = enemyData[? "Boss"];

	inst.hp = enemyData[? "Health"];
	//inst.maxHp = inst.hp;
	inst.str = enemyData[? "Strength"];
	inst.dex = enemyData[? "Dexterity"];
	inst.minExp = enemyData[? "MinExp"];
	inst.maxExp = enemyData[? "MaxExp"];
	inst.level = enemyData[? "Level"];

	inst.dropChance = enemyData[? "dropChance"];
	inst.materialID = enemyData[? "materialID"];
	inst.minCoins = enemyData[? "novasMin"];
	inst.maxCoins = enemyData[? "novasMax"];

	inst.attackID[0] = enemyData[? "attackID1"];
	inst.attackID[1] = enemyData[? "attackID2"];
	inst.attackID[2] = enemyData[? "attackID3"];
	
	inst.updated = true;
	
	return inst;
}