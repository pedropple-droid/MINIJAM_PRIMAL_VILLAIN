//Options handler
	opcoes = [" ","Play", "Configurações", "Creditos", "Sair"];
	index = 0;
	op_max = array_length(opcoes)
	
//Camera
	//Initializing Viewports
		view_enabled = true;
		view_visible[0] = true;
	
		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = 1280;
		view_hport[0] = 720;
	
	//Setting Viewports
		var _dwidth = display_get_width();
		var _dheight = display_get_height();
		var _xpos = (_dwidth / 6);
		var _ypos = (_dheight / 6);
		window_set_rectangle(_xpos, _ypos, 1280, 720);
		surface_resize(application_surface, 1280, 720)