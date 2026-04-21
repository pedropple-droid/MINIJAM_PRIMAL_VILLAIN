//Font color	
	draw_set_colour(c_white);
	draw_text(400, 100, "Controls");

//Draw menu
	for (var i = 0; i < array_length(menu); i++)
	{
		var item = menu[i];
		var dy = menu_start_y + (menu_spacing * i);

		draw_set_colour(i == index ? c_yellow : c_white);

		var text = item.name + ": ";

		if (item.waiting) text += "Press key...";
		
		else text += key_to_string(variable_global_get(item.ref));

		draw_text(400, dy, text);
	};

//Set chosen font
	draw_set_font(-1);