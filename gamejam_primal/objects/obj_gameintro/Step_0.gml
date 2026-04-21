//Check sequence finished
	if layer_sequence_is_finished(current_seq) || keyboard_check_pressed(vk_space)
	{
		layer_sequence_destroy(current_seq)
		room_goto(rm_game)
	}

