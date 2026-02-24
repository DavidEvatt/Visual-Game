/// @description Interact Key

var npc = instance_nearest(x,y ,objNPC);
if(distance_to_object(npc) <= talkingRange && !npc.working)
{
	if(npc.currentState != NPCSTATE.TALKTOPLAYER)
	{
		npc.path_speed = 0;
		npc.charCount = 0;
		talkingToNpc = true;
		npc.currentState =  NPCSTATE.TALKTOPLAYER;
	}
	
	else
	{
		npc.path_speed = npc.pathSpd;
		npc.charCount = 0;
		npc.currentState =  NPCSTATE.MOVE;
	}
}
