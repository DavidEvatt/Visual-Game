if(currentState == NPCSTATE.TALKTOPLAYER)
{
	draw_rectangle(200, 500, 1050, 700, false);
	if(needsText)
	{
		var repOption = npcData[? "PlayerDialouge"];
		
		var characterRep = ds_map_find_value(objTDPlayer.reputationTable, whoAmI);
		
		var useRep = undefined;
		
		
		//Super bad
		if( characterRep <= -75)
		{
			useRep = ds_list_find_value(repOption, 0)[? "RepMessage"];
		}
			
		//medium bad
		else if (characterRep > -75 && characterRep <= -25)
		{
			useRep = ds_list_find_value(repOption, 1)[? "RepMessage"];
		}
			
		//defualt 
		else if (characterRep > -25 && characterRep <= 25)
		{
			useRep = ds_list_find_value(repOption, 2)[? "RepMessage"];
		}
			
		//medium goood
		else if (characterRep > 25 && characterRep <= 75)
		{
			useRep = ds_list_find_value(repOption, 3)[? "RepMessage"];
		}
			
		//super good
		else if (characterRep > 75)
		{
			useRep = ds_list_find_value(repOption, 4)[? "RepMessage"];
		}
		
		
		
		if(!is_undefined(useRep))
		{
			var randVal = irandom_range(0, ds_list_size(useRep) -1)
			if(!is_undefined( ds_list_find_value(useRep, randVal)[? "message"]))
			{
				dialougeOption = ds_list_find_value(useRep, randVal)[? "message"];
			}
			
			else {show_debug_message("RepOption at " + string(randVal) + " is undefined")}
		}
		
		else {show_debug_message("RepOption is undefined at " + string(objTDPlayer.reputation))}
		
		needsText = false;
	}
	
	draw_set_colour(c_black);
	draw_set_halign(fa_left);
	
	var _text_to_draw = string_copy(dialougeOption, 1, floor(charCount));
	draw_text(500, 525, _text_to_draw);
	
	draw_set_halign(fa_center);
	
	draw_set_alpha(c_white);
}