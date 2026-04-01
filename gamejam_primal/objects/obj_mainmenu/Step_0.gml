//Menu input control
	if keyboard_check_pressed(ord("W") || vk_up)
	{
		index--;
		if(index < 0) index = op_max - 2	
		audio_play_sound(snd_Click, 1, 0)
	}

	if keyboard_check_pressed(ord("S") || vk_down)
	{
		index++;
		if(index > op_max -2) index = 0	
		audio_play_sound(snd_Click, 1, 0)
	}
	
	if keyboard_check_pressed(vk_enter || vk_space){
		if global.nag2 = 0{
		
			audio_play_sound(snd_Confirmed, 1, 0)
		}
		if(index == 0)
		{
			room_goto(Room1)
		}
		if(index == 1)
		{
			room_goto(rm_Config)	
		}
		if(index == 2)
		{
			room_goto(rm_creditos)	
		}
		if(index == 3)
		{
		
			game_end()
		}
	}

