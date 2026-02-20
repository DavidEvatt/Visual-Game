// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawingOptionGird(actionSet, xStart, yStart, lineHeight, maxColumns, currentOption, spacing, type)
{
	var returnColumns = 0;
	switch(type)
	{
		case "general":
		{
			var actionCount = array_length(actionSet);

		    // Determine column count
			var columns = 0;
			if(actionCount <= 4)
			{columns = 2; returnColumns = 2;}
			
			else
			{columns = maxColumns; returnColumns = maxColumns;}

		    // Initialize column widths
		    var colWidth = array_create(columns, 0);

		    // Measure column widths
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var text = "[" + string(i + 1) + "] " + actionSet[i];
		        var w = string_width(text);
		        colWidth[col] = max(colWidth[col], w);
		    }

		    // Draw options
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var row = floor(i / columns);

		        var xVal = xStart;
		        for (var c = 0; c < col; c++)
		        {
		            xVal += colWidth[c] + spacing;
		        }

		        var yVal = yStart + row * lineHeight;
		        var text = "[" + string(i + 1) + "] " + actionSet[i];

				

				if(i == currentOption)
				{
					draw_set_color(c_lime);
				}
				
				else
				{
					
					draw_set_color(c_white);
				}
				
				draw_text(xVal, yVal, text);
				
		    }
			
			break;
		}
	
		case "json":
		{
			var actionCount = array_length(actionSet);

		    // Determine column count
			var columns = 2;
			returnColumns = 2;
			

		    // Initialize column widths
		    var colWidth = array_create(columns, 0);

		    // Measure column widths
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var text = "";
				
				if(!is_undefined(actionSet[i][? "Cost"]))
				{
					text = "[" + string(i + 1) + "] " + actionSet[i][? "actionDescription"] + ": " + string(actionSet[i][? "Cost"]) + " Coins";
				}
				
				else text = "[" + string(i + 1) + "] " + actionSet[i][? "actionDescription"];
		        var w = string_width(text);
		        colWidth[col] = max(colWidth[col], w);
		    }

		    // Draw options
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var row = floor(i / columns);

		        var xVal = xStart;
		        for (var c = 0; c < col; c++)
		        {
		            xVal += colWidth[c] + spacing;
		        }

		        var yVal = yStart + row * lineHeight;
				var text = "";
				
				if(!is_undefined(actionSet[i][? "Cost"]))
				{
					text = "[" + string(i + 1) + "] " + actionSet[i][? "actionDescription"] + ": " + string(actionSet[i][? "Cost"]) + " Coins";
				}
				
				else text = "[" + string(i + 1) + "] " + actionSet[i][? "actionDescription"];

				if(i == currentOption)
				{
					draw_set_color(c_lime);
				}
				
				else
				{
					draw_set_color(c_white);
				}
				
		        draw_text(xVal, yVal, text);
		    }
			
			break;
		}
	
		case "material":
		{
			if(needsBackAdded)
			{
				actionSet[array_length(actionSet)] = "Back"
				needsBackAdded = false;
			}
			
			var actionCount = array_length(actionSet);

		    // Determine column count
			var columns = 4;
			returnColumns = 4;
			

		    // Initialize column widths
		    var colWidth = array_create(columns, 0);

		    // Measure column widths
		    for (var i = 0; i < array_length(actionSet); i++) 
			{
			    var col = i mod columns;
				var ID = actionSet[i]; 
				var material = grabMaterial(ID);
				var text = "";
				if(!is_undefined(material))
				{
					text = "[" + string(i + 1) + "] " + string(material[? "Name"]);
				}
				
			    
			    var textWidth = string_width(text);
			    if (textWidth > colWidth[col]) 
				{
			        colWidth[col] = textWidth;
			    }
			}

		    // Draw options
		   for (var i = 0; i < array_length(actionSet); i++) 
			{
				xVal = xStart;
				var text = "";
				
				if(i == array_length(actionSet) -1)
				{
					text = "[" + string(i + 1) + "] " + actionSet[i] ;
				}
				
				else
				{
					var ID = actionSet[i]; 
					var material = grabMaterial(ID);
					
					if(!is_undefined(material))
					{
						text = "[" + string(i + 1) + "] " +string(material[? "Name"]);
					}
				}
				
				var col = i mod columns;
			    var row = floor(i / columns)
	
				// Compute x position for this column
			    for (var c = 0; c < col; c++) 
				{
			        xVal += colWidth[c] + 20; // add spacing between columns
			    }

			    // Compute y position
			    yVal = yStart + row * lineHeight;
				
	
				if(i == currentOption)
				{
					draw_set_color(c_lime);
				}
				
				else if(i == craftingIndex[0] || i == craftingIndex[1] || i == craftingIndex[2])
				{
					draw_set_color(c_blue);	
				}
	
				else
				{
					draw_set_color(c_white);	
				}
		
				draw_text(xVal, yVal, text);
			}	
			
			break;	
		}
	
		case "bounties":
		{
			
			var actionCount = array_length(actionSet);

		    // Determine column count
			var columns = 2;
			returnColumns = 2;
			

		    // Initialize column widths
		    var colWidth = array_create(columns, 0);

		    // Measure column widths
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var text = "[" + string(i + 1) + "] " + actionSet[i][? "name"];
		        var w = string_width(text);
		        colWidth[col] = max(colWidth[col], w);
		    }

		    // Draw options
		    for (var i = 0; i < actionCount; i++)
		    {
		        var col = i mod columns;
		        var row = floor(i / columns);

		        var xVal = xStart;
		        for (var c = 0; c < col; c++)
		        {
		            xVal += colWidth[c] + spacing;
		        }

		        var yVal = yStart + row * lineHeight;
				var text = "[" + string(i + 1) + "] " + actionSet[i][? "name"];

				if(i == currentOption)
				{
					draw_set_color(c_lime);
					
					var bountyDesc = ds_list_find_value(actionSet[i][? "states"], 0)[? "description"]
					objGameController.mainText = bountyDesc;
				}
				
				else
				{
					draw_set_color(c_white);
				}
				
		        draw_text(xVal, yVal, text);
		    }
			
			break;	
		}
	}
	
	return returnColumns
}