if(showInventory && room != Room1)
{
	#region draw inventory
		draw_sprite_ext(sprInventory, 0, 0, 0, 2, 2, 0, c_white, 1);
	
		if(needsUI)
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
		}
			
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
							EquipWeapon(weaponID)
						}
					}
					
					draw_set_alpha(1)
		        }
		    }
		}
		
		
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
}