//show_debug_message("Current Time : " + string(currentTime))

if(currentTime <= maxDayTime)
{
	currentTime++;	
}

else
{
	currentTime = 0;	
}

if(currentTime >= dawnStart && currentTime < dayStart) //reducing alpha until 0
{
	portionTimer++;
	if(!global.night && portionTimer < (dayStart * 0.8)){global.night = true;}
	else if(global.night && portionTimer >=  (dayStart * 0.9)){ global.night = false}
	alphaVal = 1 - min((portionTimer + (dayStart * 0.10)) / dayStart, 1)
	//show_debug_message(string(alpha))
	//layer_background_alpha(bkg, alpha);
}

else if(currentTime >= dayStart && currentTime < duskStarts)
{
	if(portionTimer != 0){portionTimer = 0;}
	if(global.night){global.night = false;}
	alphaVal = 1 - dayStart * 0.8;
}

else if(currentTime >= duskStarts && currentTime < nightStarts) //building alpha until 1
{
	portionTimer++;
	if(!global.night && portionTimer >  (duskStarts * 0.8)){global.night = true;}
	else if(!global.night && portionTimer <=  (duskStarts * 0.8)){ global.night = false}
	alphaVal = min((portionTimer + (nightStarts * 0.10)) / nightStarts, 1)
	//show_debug_message(string(alpha))
	//layer_background_alpha(bkg, alpha);
}

else if(currentTime >= nightStarts)
{
	if(portionTimer != 0){portionTimer = 0;}
	if(!global.night){global.night = true;}
	alphaVal = dayStart * 0.8;
}










