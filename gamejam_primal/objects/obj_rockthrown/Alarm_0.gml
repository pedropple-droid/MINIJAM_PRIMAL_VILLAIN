//Creates falling sequence
	//Create chosen obstacle
		seq_rock = seq_fallingrock;
		fallrock_seq = layer_sequence_create("Instances", spawn_x, spawn_y, seq_rock);
		
	//Sound
		sound_handler(snd_rockhitground)
	
	//Destroy sequence
		layer_sequence_destroy(current_seq);
		current_seq = -1;
	
	//Starts new alarm
		alarm[1] = 15