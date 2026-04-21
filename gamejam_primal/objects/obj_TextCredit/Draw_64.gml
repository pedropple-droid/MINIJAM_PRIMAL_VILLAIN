//Chooses font
	draw_set_font(f_default);
	draw_set_colour(c_white);

//Draws font text
	for (var i = 0; i < cr_max; i++)
	{
		var dy = menu_start_y + (menu_spacing * i)
		
		draw_text(425, dy, creditos[i]);
	}

//Uses chosen font
	draw_set_font(-1);