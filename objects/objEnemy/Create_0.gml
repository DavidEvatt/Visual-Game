// Default values (safe initialization)

homeX = x;
homeY = y;

newX = x;
newY = y;

movingToSpot = false;

tempHomeX = undefined;
tempHomeY = undefined;

holdTempLocationTimer = 0;

holdNewSpotTimer = 0;
isDodging = false

enemyData = undefined;

image_xscale = -1;


boss = false
beenHit = false

attackID[0] = "";
attackID[1] = "";
attackID[2] = "";

updated = false;

//moving it in the screen
right = true;
hsp = 0;
vsp = 0;

knockback = 0;

grv = 0.5;
vSpeed = 0;

//debufs
maxFreezeDur = 2;
curFreezeDur = 0;
frozen = false;

maxBindDur = 2;
curBindDur = 0;
bound = false

canCharge = true;


curHitStun = 0;

counter = false;

currentState = ENEMYSTATE.IDLE;
targX = x;
targY = y;

giveUpCounter = 0

hadLos = false;
lostPlayer = false;

chargeUp = 10
curCharge = 0;
atkCooldown = 0;

enum ENEMYSTATE
{
	IDLE,
	PURSUE,
	ATTACK,
	HIT,
	RUN
}