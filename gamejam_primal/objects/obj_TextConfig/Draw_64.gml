//Creates menu text
	for (var i = 0; i < menu_max; i++)
	{
	    var item = menu[i];
	    var dy = menu_start_y + (menu_spacing * i);
	    var value_display = "";

	    //Set color: Yellow if selected, White if not
	    draw_set_colour(i == index ? c_yellow : c_white);

	    //Switch logic to prepare the display value and extra graphics
	    switch (item.type) 
	    {
	        case "slider":
	            var sliderVal = variable_global_get(item.ref);
	            if (is_undefined(sliderVal)) sliderVal = 50; 
	            value_display = string(sliderVal);
	            draw_sprite_ext(spr_ControlerSound, sliderVal, 650, dy, 2, 2, 0, c_white, 1);
	        break;

	        case "list":
	            value_display = item.options[item.index];
	        break;

	        case "keybind":
	            value_display = "(Press Enter or Space)";
	        break;
	    }

	    draw_text(400, dy, item.name + ": " + value_display);
	}

//Reset colour
	draw_set_colour(c_white);