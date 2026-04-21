//Menu input control
	//Local Variables
	var key_up   = (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));
	var key_down = (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down));
	var key_select  = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space));
	
	var current = menu[index]
	var current_ref = current.ref
	
	switch (current.type)
	{
		case "button":
			if key_select
			{
				sound_handler(snd_selectother, , , false)
				if (current_ref == "play") 
				{
					audio_stop_sound(snd_menusong)
					sound_handler(snd_selectplay, , , false)
					room_goto(rm_intro)
				}
				if (current_ref == "settings") room_goto(rm_configs)	
				if (current_ref == "credits") room_goto(rm_creditos)	
				if (current_ref == "xtgm") game_end()
				
			};
	}
	
	if key_up
	{
		index--;
		if (index < 0) index = (menu_max - 1);
		
		sound_handler(snd_movemenu, , , false)
	};

	if key_down
	{
		index++;
		if (index >= menu_max) index = 0;
		
		sound_handler(snd_movemenu, , , false)
	};

