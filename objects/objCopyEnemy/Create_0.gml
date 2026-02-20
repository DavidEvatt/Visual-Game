/// @description Insert description here
// You can write your code in this editor












// Inherit the parent event
event_inherited();

weapon = "fist"
weaponType = "SWORD"
startAtk = false
hpDisplay = hp;
varDisplaySpd = 0.03;
curDodgeCD = 0;
isDodging = false;
needsDodge = false
currentState = COPYENEMYSTATE.IDLE

enum COPYENEMYSTATE
{
	IDLE,
	INCOMBAT,
	RUN,
	HEAL,
	ATTACK,
	DODGE,
	HIT
}

//colors
playerColors[0] = make_color_rgb(255, 207, 159)	//Skin
playerColors[1] = make_color_rgb(223, 199, 135) //Horn 
playerColors[2] = make_color_rgb(223, 199, 135) //Hoof
playerColors[3] = make_color_rgb(255, 255, 255)	//Hair / Legs
playerColors[4] = make_color_rgb(103, 103, 23)	//Eyei
playerColors[5] = make_color_rgb(207, 55, 7)	//Body

weaponColor[0] = c_maroon;
weaponColor[1] = c_gray;
weaponColor[2] = c_yellow;
weaponColor[3] = c_white;