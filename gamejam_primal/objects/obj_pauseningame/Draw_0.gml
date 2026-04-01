//Código que cria a tela preta
	if global.pause
	{
		draw_set_alpha(0.9);
		draw_set_colour(c_black);
		draw_rectangle_colour(0, 0, 2732, 768, c_black, c_black, c_black, c_black, false)
	}
	else
	{
		draw_set_alpha(1);
		draw_set_colour(c_white);
	}