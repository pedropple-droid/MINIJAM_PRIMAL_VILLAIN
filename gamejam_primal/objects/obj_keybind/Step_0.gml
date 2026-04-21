//Current option
	var current = menu[index];

///Rebind mode
	if current.waiting
	{
		if keyboard_check_pressed(vk_anykey)
		{
			if (keyboard_lastkey != vk_enter && keyboard_lastkey != vk_space)
			{
				variable_global_set(current.ref, keyboard_lastkey);
				current.waiting = false;
				keyboard_lastkey = -1;
			};
		};
		exit;
	};

///Navigation
	var key_up    = keyboard_check_pressed(global.key_up);
	var key_down  = keyboard_check_pressed(global.key_down);
	var key_select = keyboard_check_pressed(global.key_select);
	var key_escape = keyboard_check_pressed(global.key_escape);
	
	if key_up
	{
		index--;
		if (index < 0) index = (menu_max - 1);
		
		//audio_play_sound(snd_Click, 1, 0)
	};

	if key_down
	{
		index++;
		if (index >= menu_max) index = 0;
		
		//audio_play_sound(snd_Click, 1, 0)
	};

	
//Selection
	if key_select
	{
	    current.waiting = true;
	    keyboard_lastkey = -1; // Clear previous keys before starting
    };

//Return
	if key_escape
	{
		room_goto(rm_mainmenu);
	};