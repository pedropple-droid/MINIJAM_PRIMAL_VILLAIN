//Keybind controls handler
	menu = [
		{ name:"Move up", ref:"key_up", waiting:false         },
		{ name:"Move Down", ref:"key_down", waiting:false     },
		{ name:"Move Left", ref:"key_left", waiting:false     },
		{ name:"Move Right", ref:"key_right", waiting:false   },
	];

	index = 0;

	menu_max = array_length(menu)

	menu_start_y = 120;
	menu_spacing = 120;