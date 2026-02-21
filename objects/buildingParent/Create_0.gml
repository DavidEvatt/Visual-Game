npcType = undefined;
npcFollow = noone;
open = false;

if(npcName != "none")
{	
	npcType = 
	{
		whoAmI: npcName,
		pathSpd: 1
	}

	var npc = instance_create_layer(npcX, npcY, "Housing", objNPC, npcType)

	npcFollow = npc;
}
