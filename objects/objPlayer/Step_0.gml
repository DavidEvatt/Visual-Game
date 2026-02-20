
if(hpDisplay != hp)
{
	hpDisplay = lerp(hpDisplay, hp, varDisplaySpd);

	// Snap to actual hp when close
	if (abs(hpDisplay - hp) < 0.1) hpDisplay = hp;
}


if(manaDisplay != mana)
{
	manaDisplay = lerp(manaDisplay, mana, varDisplaySpd);

	// Snap to actual hp when close
	if (abs(manaDisplay - mana) < 0.1) manaDisplay = mana;
}

if(xpDisplay != xp)
{
	xpDisplay = lerp(xpDisplay, xp, varDisplaySpd);

	// Snap to actual hp when close
	if (abs(xpDisplay - xp) < 0.1) xpDisplay = xp;
}


var nextX;
if(right)
{
	nextX = x + moveSpd;
}

else
{
	nextX = x - moveSpd	
}

if(place_meeting(nextX, y, objWall))
{
	right = !right;
	image_xscale = -image_xscale;
}

else
{
	if(!frozen and !bound)
	{
		x = nextX;	
	}
}

vSpeed += grv;

// --- VERTICAL COLLISION ---
if (place_meeting(x, y + vSpeed, objFloor)) {
    // Snap to floor
    while (!place_meeting(x, y + sign(vSpeed), objFloor)) {
        y += sign(vSpeed);
    }
    vSpeed = 0;
} else {
    // Free fall
    y += vSpeed;
}
