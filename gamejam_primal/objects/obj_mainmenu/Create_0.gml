//Options handler
	menu = [
		{ name:"Play", scribname:"[wave]Play[wave]", type:"button", ref:"play"         },
		{ name:"Settings", scribname:"[wave]Settings[wave]", type:"button", ref:"settings" },
		{ name:"Credits", scribname:"[wave]Credits[wave]", type:"button", ref:"credits"   },
		{ name:"Exit game", scribname:"[wave]Exit game[wave]", type:"button", ref:"xtgm"    },
	];
	
	index  = 0;
	
	menu_max = array_length(menu)
	
	menu_start_y = 380;
	menu_spacing = 80;
	
//Global variables
	global.overall_score = 0
	//Defaults
		if (!variable_global_exists("FXvolume"))		     global.FXvolume = 50;
		if (!variable_global_exists("MUSvolume"))		    global.MUSvolume = 50;
		if (!variable_global_exists("resolution")) global.resolution = "1280x720";
		if (!variable_global_exists("key_up"))		     global.key_up = ord("W");
		if (!variable_global_exists("key_down"))	   global.key_down = ord("S");
		if (!variable_global_exists("key_left"))	   global.key_left = ord("A");
		if (!variable_global_exists("key_right"))     global.key_right = ord("D");
		if (!variable_global_exists("key_select"))   global.key_select = vk_space;
		if (!variable_global_exists("key_escape"))  global.key_escape = vk_escape;
		if (!variable_global_exists("gain"))					global.gain = 0.2;
		//Loads the score
		scr_loadScore()

//Music
	if !audio_is_playing(snd_menusong)
	{
		sound_handler(snd_menusong, true)
	}

//Camera
	//Initializing Viewports
		view_enabled    = true;
		view_visible[0] = true;
	
		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = 1280;
		view_hport[0] = 720;
	
	//Setting Viewports
		var _dwidth  = display_get_width();
		var _dheight = display_get_height();
		var _xpos    = (_dwidth / 6);
		var _ypos    = (_dheight / 6);
		window_set_rectangle(_xpos, _ypos, 1280, 720);
		surface_resize(application_surface, 1280, 720)