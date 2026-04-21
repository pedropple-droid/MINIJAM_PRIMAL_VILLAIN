//Inputs handler
	//Useful variables
	//Use max() to check multiple keys at once
	var key_up    = keyboard_check_pressed(ord("W"))  || keyboard_check_pressed(vk_up);
	var key_down  = keyboard_check_pressed(ord("S"))  || keyboard_check_pressed(vk_down);
	var key_left  = keyboard_check_pressed(ord("A"))  || keyboard_check_pressed(vk_left);
	var key_right = keyboard_check_pressed(ord("D"))  || keyboard_check_pressed(vk_right);
	var key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	var key_escape = keyboard_check_pressed(vk_escape);
	
	var current = menu[index]
	
	if keyboard_check_pressed(vk_escape)
	{
		room_goto(rm_mainmenu)
	};
		
	//Navigating
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


	//Interacting
	switch current.type
	{
		case "slider":
			var val = variable_global_get(current.ref);

			if (key_left)  val -= current.step;
			if (key_right) val += current.step;

			val = clamp(val, current.min, current.max);
			variable_global_set(current.ref, val);
		break;

		case "list":
			if (key_left)  current.index--;
			if (key_right) current.index++;

			var len = array_length(current.options);
			
			if (current.index < 0) current.index = len - 1;
			if (current.index >= len) current.index = 0;
		break;

		case "keybind":
			if (key_select) room_goto(rm_keybinds);
		break;
	};