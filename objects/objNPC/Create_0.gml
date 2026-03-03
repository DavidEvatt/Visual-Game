needsPlace = true;
atPlace = false

targ = noone;
trailBlaze = false;

ADHD = 0;
maxADHD = 600;

talkLength = 0;
maxTalkLength = 300;

reset = false
working = false;
awake = false
startDay = false

stateVarb = "IDLE"

currentState = NPCSTATE.IDLE

enum NPCSTATE
{
	IDLE,
	MOVE,
	TALK,
	TALKTOPLAYER,
	DISTRACTED,
	WORK
}

target_list = ds_list_create();

location = [];
array_push(location, 2)
array_push(location, 6)



eventPosition = 0;


attentionSpan = 0

talkingRange = 120;

wakeUp = 0;
sleep = 0;
nocturnal = false;

needsText = true;
dialougeOption = "";
charCount = 0;
typeSpd = 0.4; // Characters per frame

//Variables to make distracted state work
tempHomeX = undefined;
tempHomeY = undefined;
holdNewSpotTimer = 0
newSpotTimer = 120;
movingToSpot = false;

dps = 600;


newX = x;
newY = y;

distracted = false

moveRange48 = 1.5

//load in schedule and actions
schedule = ds_list_create();
actions = ds_list_create();

loadInNpc(whoAmI)