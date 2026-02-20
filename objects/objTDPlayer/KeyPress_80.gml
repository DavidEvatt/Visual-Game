if(room != Room1)
{/// @description Insert description here
	if(colorChange == 0) //ice
	{
		colorChange = 1;
		playerColors[0] = make_color_rgb(241, 246, 240)	//Skin
		playerColors[1] = make_color_rgb(150, 169, 193) //Horn 
		playerColors[2] = make_color_rgb(150, 169, 193) //Hoof
		playerColors[3] = make_color_rgb(187, 195, 208)	//Hair / Legs
		playerColors[4] = make_color_rgb(64, 82, 115)	//Eyei
		playerColors[5] = make_color_rgb(108, 129, 161)	//Body
	
		EquipWeapon("woodSword")
	}

	else if(colorChange == 1) //default
	{
		colorChange = 0;
		playerColors[0] = make_color_rgb(255, 207, 159)	//Skin
		playerColors[1] = make_color_rgb(223, 199, 135) //Horn 
		playerColors[2] = make_color_rgb(223, 199, 135) //Hoofos
		playerColors[3] = make_color_rgb(103, 29, 7)	//Hair / Legs
		playerColors[4] = make_color_rgb(103, 103, 23)	//Eyei
		playerColors[5] = make_color_rgb(207, 55, 7)	//Body	
	
		EquipWeapon("shield")
	}
}









