//Escape key handler
	//Checks if not playing
		if room != Room1
		{
			if keyboard_check_pressed(vk_escape)
			{
				room_goto(rm_TelaInicial)
			}
		}
		
	//If playing, pauses
	else
	{
		if keyboard_check_pressed(vk_escape)
		{
			global.pause = !global.pause
		}	
	}