//Chooses font
	draw_set_font(f_TelaInic);
	draw_set_colour(c_white);

//Draws font text
	for(var i=0;i<op_max;i++) draw_text(425,200 + (60 * i),opcoes[i]);

//Uses chosen font
	draw_set_font(-1);