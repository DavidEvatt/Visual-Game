if(showInventory && room != Room1)
{
	#region draw inventory
		var imageNumber = 0;
		
		switch(currentSelector)
		{
			case SELECTOR.NONE:
			{
				imageNumber = 0;
				break;
			}
			
			case SELECTOR.MAGIC:
			{
				imageNumber = 1;
				break;
			}
		}
		
		draw_sprite_ext(sprInventory, imageNumber, 0, 0, 2, 2, 0, c_white, 1);
	
		if(needsUI)
		{
			switch(currentSelector)
			{
				case SELECTOR.NONE:
				{
					for(var i = 0; i < ds_list_size(objTDPlayer.obtainedWeapons); i++)
					{
						var weapon = grabWeapon(ds_list_find_value(objTDPlayer.obtainedWeapons, i));
						weaponInventory[weaponRows][weaponCollumns] = weapon
			
						if(weaponRows >= 4)
						{
							weaponRows = 0;
							weaponCollumns++;
						}
			
						else weaponRows++; trackRows++;
			
						if(weaponCollumns > 3){weaponCollumns = 3; trackCol++;}
						//itemXYBounds[][] = ds_list_find_value(objTDPlayer.obtainedWeapons, i);
			
						needsUI = false
					}
					break;	
				}
				
				case SELECTOR.MAGIC:
				{
					for(var i = 0; i < ds_list_size(objTDPlayer.knownAttacks); i++)
					{
						var weapon = grabAttack(ds_list_find_value(objTDPlayer.knownAttacks, i));
						weaponInventory[weaponRows][weaponCollumns] = weapon
			
						if(weaponRows >= 4)
						{
							weaponRows = 0;
							weaponCollumns++;
						}
			
						else weaponRows++; trackRows++;
			
						if(weaponCollumns > 3){weaponCollumns = 3; trackCol++;}
						//itemXYBounds[][] = ds_list_find_value(objTDPlayer.obtainedWeapons, i);
			
						needsUI = false
					}
					break;	
				}
			}
			
		}
			
	#region Grid Drawing
		var gridSize = 64;
		var spacing  = 32; // 96
		var step     = gridSize + spacing;

		var gridX = 5;
		var gridY = 4;

		// original anchor
		var startX = 738;
		var startY = 225;

		// per-cell offset
		var offsetX = -32
		var offsetY = -32;

		var mx = device_mouse_x_to_gui(0);
		var my = device_mouse_y_to_gui(0);

		for (var row = 0; row < gridX; row++)
		{
		    for (var col = 0; col < gridY; col++)
		    {
				var weapon = weaponInventory[row][col]
				if(!is_undefined(weapon))
				{
					switch(weapon[? "type"])
					{
						case "FIST":
						{
							colorMyself(
								self,
								objTDPlayer.playerColors[0],
								objTDPlayer.playerColors[1],
								objTDPlayer.playerColors[2],
								objTDPlayer.playerColors[3],
								objTDPlayer.playerColors[4],
								objTDPlayer.playerColors[5],
								objTDPlayer.weaponColor[0],
								objTDPlayer.weaponColor[1],
								objTDPlayer.weaponColor[2],
								objTDPlayer.weaponColor[3]
							)
							draw_sprite_ext(sprFist, 0, 738 + (drawWeaponSpacing * row), 225 + (drawWeaponSpacing * col), 2, 2, 0, c_white, 1);
							shader_reset()
							break;	
						}
				
						case "SWORD":
						{
							var weaponColor = [];
							for(var i = 0; i < 3; i++)
							{
								var index = ds_list_find_value(weapon[? "Part Colors"], i);
								var thisOne = make_color_rgb(index[? "R"], index[? "G"], index[? "B"]);
								array_push(weaponColor, thisOne);
							}	
		
							colorMyself(
								self,
								objTDPlayer.playerColors[0],
								objTDPlayer.playerColors[1],
								objTDPlayer.playerColors[2],
								objTDPlayer.playerColors[3],
								objTDPlayer.playerColors[4],
								objTDPlayer.playerColors[5],
								weaponColor[0],
								weaponColor[1],
								weaponColor[2],
								weaponColor[0]
							)
							draw_sprite_ext(sprSword, 0, 738 + (drawWeaponSpacing * row), 225 + (drawWeaponSpacing * col), 2, 2, 0, c_white, 1)
							shader_reset();
							break;	
						}
						
						case "STAFF":
						{
							var weaponColor = [];
							for(var i = 0; i < 3; i++)
							{
								var index = ds_list_find_value(weapon[? "Part Colors"], i);
								var thisOne = make_color_rgb(index[? "R"], index[? "G"], index[? "B"]);
								array_push(weaponColor, thisOne);
							}	
		
							colorMyself(
								self,
								objTDPlayer.playerColors[0],
								objTDPlayer.playerColors[1],
								objTDPlayer.playerColors[2],
								objTDPlayer.playerColors[3],
								objTDPlayer.playerColors[4],
								objTDPlayer.playerColors[5],
								weaponColor[0],
								weaponColor[1],
								weaponColor[2],
								weaponColor[0]
							)
							draw_sprite_ext(sprStick, 0, 738 + (drawWeaponSpacing * row), 225 + (drawWeaponSpacing * col), 2, 2, 0, c_white, 1)
							shader_reset();
							break;	
						}
							
						case "spell":
						{
							draw_sprite_ext(sprLIght1, 0, 738 + (drawWeaponSpacing * row), 225 + (drawWeaponSpacing * col), 2, 2, 0, c_white, 1);	
							break;	
						}
					}
				}
		
		        var cx = startX + row * step + offsetX;
		        var cy = startY + col * step + offsetY;

		        if (mx > cx && mx < cx + gridSize &&
		            my > cy && my < cy + gridSize)
		        {
					draw_set_alpha(0.4)
		            draw_rectangle(
		                cx, cy,
		                cx + gridSize, cy + gridSize,
		                false
		            );
					
					if(mouse_check_button_pressed(mb_left))
					{
						if(!is_undefined(weapon))
						{
							var weaponID = weapon[? "ID"];
							
							if(weapon[? "type"] == "spell")
							{
								mAttacks[3]	= weaponID
							}
							
							else
							{
								EquipWeapon(weaponID);
							}
						}
					}
					
					draw_set_alpha(1)
		        }
		    }
		}
		
	#endregion
		
		
	#endregion
	//draw player in middle	
	if(x != 465)
	{
		x = 465;
		y = 375;
	}
	
	if(image_xscale != 4){image_xscale = 4; image_yscale = 4};
	

	
	colorMyself(
				self,
				objTDPlayer.playerColors[0],
				objTDPlayer.playerColors[1],
				objTDPlayer.playerColors[2],
				objTDPlayer.playerColors[3],
				objTDPlayer.playerColors[4],
				objTDPlayer.playerColors[5],
				objTDPlayer.weaponColor[0],
				objTDPlayer.weaponColor[1],
				objTDPlayer.weaponColor[2],
				objTDPlayer.weaponColor[3]
				)
	
	draw_sprite_ext(sprite_index, image_index, 465, 375, 4, 4, 0, c_white, 1)
	shader_reset()
	
	
	
	
	/*
		Drawing Squares to see where mouse needs to be
		
		draw_set_color(c_black)
		draw_rectangle(675, 85, 800, 165, false); //sword
		draw_set_color(c_purple)
		draw_rectangle(810, 105, 925, 165, false); //book
	*/
	
	//mosue between positions then draw a gray box
	if(device_mouse_x_to_gui(0) >= 675 && device_mouse_x_to_gui(0) <= 800)
	{
		if(device_mouse_y_to_gui(0) >= 85 && device_mouse_y_to_gui(0) <= 165)
		{
			draw_set_colour(c_gray);
			draw_set_alpha(0.3);	
			draw_rectangle(675, 85, 800, 165, false);
			
			//if there is a click then set youself to this option and reset the array
			if(mouse_check_button_pressed(mb_left))
			{
				if(currentSelector != SELECTOR.NONE)
				{
					currentSelector = SELECTOR.NONE;
					needsUI = true; 
					weaponCollumns = 0; 
					weaponRows = 0; 
					trackRows = 0; 
					trackCol = 0

					weaponInventory[0][0] = undefined
					weaponInventory[1][0] = undefined
					weaponInventory[2][0] = undefined
					weaponInventory[3][0] = undefined
					weaponInventory[4][0] = undefined

					weaponInventory[0][1] = undefined
					weaponInventory[1][1] = undefined
					weaponInventory[2][1] = undefined
					weaponInventory[3][1] = undefined
					weaponInventory[4][1] = undefined

					weaponInventory[0][2] = undefined
					weaponInventory[1][2] = undefined
					weaponInventory[2][2] = undefined
					weaponInventory[3][2] = undefined
					weaponInventory[4][2] = undefined

					weaponInventory[0][3] = undefined
					weaponInventory[1][3] = undefined
					weaponInventory[2][3] = undefined
					weaponInventory[3][3] = undefined
					weaponInventory[4][3] = undefined
				}
			}
		}
	}
	
	//same as above
	if(device_mouse_x_to_gui(0) >= 810 && device_mouse_x_to_gui(0) <= 925)
	{
		if(device_mouse_y_to_gui(0) >= 105 && device_mouse_y_to_gui(0) <= 165)
		{
			draw_set_colour(c_gray);
			draw_set_alpha(0.3);	
			draw_rectangle(810, 105, 925, 165, false);
			
			if(mouse_check_button_pressed(mb_left))
			{
				if(currentSelector != SELECTOR.MAGIC)
				{
					currentSelector = SELECTOR.MAGIC;
					needsUI = true; 
					weaponCollumns = 0; 
					weaponRows = 0; 
					trackRows = 0; 
					trackCol = 0

					weaponInventory[0][0] = undefined
					weaponInventory[1][0] = undefined
					weaponInventory[2][0] = undefined
					weaponInventory[3][0] = undefined
					weaponInventory[4][0] = undefined

					weaponInventory[0][1] = undefined
					weaponInventory[1][1] = undefined
					weaponInventory[2][1] = undefined
					weaponInventory[3][1] = undefined
					weaponInventory[4][1] = undefined

					weaponInventory[0][2] = undefined
					weaponInventory[1][2] = undefined
					weaponInventory[2][2] = undefined
					weaponInventory[3][2] = undefined
					weaponInventory[4][2] = undefined

					weaponInventory[0][3] = undefined
					weaponInventory[1][3] = undefined
					weaponInventory[2][3] = undefined
					weaponInventory[3][3] = undefined
					weaponInventory[4][3] = undefined
				}
			}
		}
	}
	
	
	draw_set_alpha(1);
}