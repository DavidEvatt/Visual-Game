needsDefinition = true;
nightTime = false
depth = 2;

npcType = 
{
	whoAmI: npcName,
	pathSpd: 1
}


npc = instance_create_layer(npcX, npcY, "Housing", objNPC, npcType)

npcFollow = npc;

open = false;