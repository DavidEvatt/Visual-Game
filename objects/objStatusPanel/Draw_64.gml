//health bar
if(room != Room1)
{
	#region BARS
	draw_set_font(ftBars)
	draw_set_color(c_white);
		var hpPercent = objTDPlayer.hp / objTDPlayer.maxHp;
		hpPercent = clamp(hpPercent, 0, 1);
		
		var hpColor;

		if (hpPercent > 0.5) {
			var t = (hpPercent - 0.5) / 0.5;
			hpColor = merge_color(colorYellow, colorGreen, t);
		} else {
			var t = hpPercent / 0.5;
			hpColor = merge_color(colorRed, colorYellow, t);
		}
		
		draw_sprite(sprBarBKG, 0, 15, 13);
		draw_sprite_ext(sprHealth, 0, 18, 15, max(objTDPlayer.hpDisplay / objTDPlayer.maxHp, 0) * 416, 1, 0, hpColor, 1);
		draw_sprite(sprBars, 0, 15, 13)
		draw_text(220, 30, "Health: " + string(floor(objTDPlayer.hp)) + "/" + string(objTDPlayer.maxHp));

		//mana bar
		var manaPercent = objTDPlayer.mana / objTDPlayer.maxMana;
		manaPercent = clamp(manaPercent, 0, 1);
		
		var manaColor;

		if (manaPercent > 0.5) {
			var t = (manaPercent - 0.5) / 0.5;
			manaColor = merge_color(colorViolet, colorPurple, t);
		} else {
			var t = manaPercent / 0.5;
			manaColor = merge_color(colorDarkBlue, colorViolet, t);
		}
		
		draw_sprite(sprBarBKG, 0, 15, 50);
		draw_sprite_ext(sprHealth, 0, 18, 53, (objTDPlayer.manaDisplay / objTDPlayer.maxMana) * 416, 1, 0, manaColor, 1);
		draw_sprite(sprBars, 0, 15, 50);
		draw_text(220, 68, "Mana: " + string(floor(objTDPlayer.mana)) + "/" + string(objTDPlayer.maxMana));

		//exp bar
		var barCheck = objTDPlayer.xpToNext
	
		if(objTDPlayer.xp >= barCheck)
		{
			for(var i = 1; i < 5; i++)
			{
				barCheck *= 1.5;
		
				if(objTDPlayer.xp >= barCheck)
				{
					colorExp = xpColors[i];
				}
			}
		}
	
		else colorExp = xpColors[0];
	
	
		draw_sprite(sprBarBKGXp, 0, 15, 88);
		draw_sprite_ext(sprXP, 0, 18, 90, min((objTDPlayer.xpDisplay / objTDPlayer.xpToNext) * 416, 416), 1, 0, colorExp, 1);
		draw_sprite(sprBarsXP, 0, 15, 88);

	#endregion
	
	#region Utility Items
	draw_sprite_ext(sprCombatQue, 0, 144, 600, 3, 3, 0, c_white, 0.5)
	if(curPotionInventory - 1 <= -1)
	{
		var potion = grabPotion(potionInventory[2]);
		if(!is_undefined(potion))
		{
			var potionImage = asset_get_index(potion[? "image"])
			draw_sprite_ext(potionImage, 0, 174, 630, 2, 2, 0, c_white, 1)	
		}
	}

	else
	{
		var potion = grabPotion(potionInventory[curPotionInventory -1]);
		if(!is_undefined(potion))
		{
			var potionImage = asset_get_index(potion[? "image"])
			draw_sprite_ext(potionImage, 0, 174, 630, 2, 2, 0, c_white, 1)	
		}
	}

	draw_sprite_ext(sprCombatQue, 0, 16, 600, 3, 3, 0, c_white, 0.5)
	if(curPotionInventory + 1 >= array_length(potionInventory))
	{
		var potion = grabPotion(potionInventory[0]);
		if(!is_undefined(potion))
		{
			var potionImage = asset_get_index(potion[? "image"])
			draw_sprite_ext(potionImage, 0, 46, 630, 2, 2, 0, c_white, 1)	
		}
	}

	else
	{
		var potion = grabPotion(potionInventory[curPotionInventory + 1]);
		if(!is_undefined(potion))
		{
			var potionImage = asset_get_index(potion[? "image"])
			draw_sprite_ext(potionImage, 0, 46, 630, 2, 2, 0, c_white, 1)	
		}
	}


	draw_sprite_ext(sprCombatQue, 0, 80, 590, 3, 3, 0, c_white, 0.8)
	var potion = grabPotion(potionInventory[curPotionInventory]);
	if(!is_undefined(potion))
	{
		var potionImage = asset_get_index(potion[? "image"])
		draw_sprite_ext(potionImage, 0, 110, 620, 2, 2, 0, c_white, 1)	
	}

	draw_text(240, 645, "R>")
	draw_text(105, 660, "Q")
	var amount = ds_map_find_value(objTDPlayer.potionInventory, potionInventory[curPotionInventory])
	draw_text(135, 660, string(amount))
	
	#endregion
}






