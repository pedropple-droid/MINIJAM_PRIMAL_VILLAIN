//Creates menu text
	for(var i = 0; i < menu_max; i++)
	{
		var item = menu[i];
		var dy = menu_start_y + (menu_spacing * i);
		
		// Highlight selected item
		scribble_color_set(i == index ? c_yellow : c_black);
		
		// Initial text (Name of the setting)
	    var text_label = (i == index ? item.scribname : item.name);
		
	    var value_display = "";
		var val = variable_global_get(item.ref);
		// Safety Check: if val is undefined, default to 0 to prevent crash
        if (is_undefined(val)) val = 0; 
		
		scribble(text_label).draw(150, dy);
	};
	
	draw_set_font(-1);

//Draws hi-score
	draw_set_colour(c_black)
	var _curW = display_get_gui_width() / 3
	var _curH = display_get_gui_height() / 2.5
	
	scribble("[f_skip][wave]Current Hi-Score:[wave] " + string(round(global.overall_score))).draw(_curW,_curH)