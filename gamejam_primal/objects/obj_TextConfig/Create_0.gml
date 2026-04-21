//Texts handler
	menu = [
		{ type:"slider", name:"Music",   ref:"MUSvolume", min:0, max:100, step:5  },
		{ type:"slider", name:"Effects", ref:"FXvolume", min:0, max:100, step:5  },
		
		{ type:"list", name:"Resolution", ref:"resolution", options:["800x600","1280x720","1920x1080"], index: 1 },
		
		{ type:"keybind", name:"Keybinds", ref:"keybind"}
	];
	
	index  = 0;
	
	menu_max = array_length(menu);

	menu_start_y = 120;
	menu_spacing = 120;
	
