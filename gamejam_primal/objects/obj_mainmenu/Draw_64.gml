//Font select
	draw_set_font(f_TelaInic);
	draw_set_colour(c_white);

//Creates menu text
	for(var i=0;i<op_max;i++)
	{
		draw_text(90,350 + (60 * i),opcoes[i]);
		
		if(index==i) draw_set_colour(c_yellow)
		
		else draw_set_colour(c_white);
	};

//Uses selected font
	draw_set_font(-1);