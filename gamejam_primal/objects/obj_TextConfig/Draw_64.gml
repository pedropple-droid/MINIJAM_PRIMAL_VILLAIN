//Chooses font
	draw_set_font(f_TelaInic)
	draw_set_colour(c_white)

//Draw configs text
	draw_text(450,200,"Settings")

//Configures color changing options
	for(var i=0;i<op_max;i++){
		draw_text(450,200 + (100 * i),opcoes[i])
	
		if(index==i){
			draw_set_colour(c_yellow)	
		}
		else{
			draw_set_colour(c_white)	
		}
	}

//Draws font as chosen above
	draw_set_font(-1)

//Draws sound control options
	draw_sprite_ext(spr_ControlerSound, global.nag1, 450, 450, 2, 2,0, c_white, 1)	
	draw_sprite_ext(spr_ControlerSound, global.nag2, 450, 550, 2, 2,0, c_white, 1)	


