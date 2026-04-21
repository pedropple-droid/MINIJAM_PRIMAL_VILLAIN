//Variables
	pause = false;
	pauseSurf = -1;
	pauseSurfBuffer = -1;

	resW = display_get_width()
	resH = display_get_height()

	text = "[wave][f_default]Score: [wave]" + string(round(global.player_score));
	guiW = display_get_gui_width()
	guiH = display_get_gui_height()
	
	menu_start_y = guiH/3.5;
	menu_spacing = 100;
	
	setting = false
	keybind = false
	fmenu = false

//Menu array
	menu = [
		{ name:"Resume", type:"button", ref:"continue" },
		{ name:"Settings", type:"button", ref:"settings" },
		{ name:"Exit game", type:"button", ref:"xtgm"    },
	];
	
	index = 0;
	menu_max = array_length(menu)
	
//Settings array
	st_menu = [
		{ type:"slider", name:"Music",   ref:"MUSvolume", min:0, max:100, step:5  },
		{ type:"slider", name:"Effects", ref:"FXvolume", min:0, max:100, step:5  },
		{ type:"list", name:"Resolution", ref:"resolution", options:["800x600","1280x720","1920x1080"], st_index: 1 },
		{ type:"keybind", name:"Keybinds", ref:"keybind" },
		{ type:"return", name:"Return", ref:"return" },
	];
	
	st_index  = 0;
	st_menu_max = array_length(st_menu);
	
//Keybind array
	kb_menu = [
		{ type:"keybinder", name:"Move up", ref:"key_up", waiting:false         },
		{ type:"keybinder", name:"Move Down", ref:"key_down", waiting:false     },
		{ type:"keybinder", name:"Move Left", ref:"key_left", waiting:false     },
		{ type:"keybinder", name:"Move Right", ref:"key_right", waiting:false   },
		{ type:"return", name:"Return", ref:"return", },
	];

	kb_index = 0;
	kb_menu_max = array_length(kb_menu)