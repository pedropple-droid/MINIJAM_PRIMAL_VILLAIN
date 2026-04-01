//Create obstacle
	//Time till destroy rock and start next sequence
		var seq_time = 15;
		
	//Create chosen obstacle
		seq_rock = seq_fallingrock;
		fallrock_seq = layer_sequence_create("Instances", spawn_x, spawn_y, seq_rock);
	
	//Destroy sequence
		layer_sequence_destroy(current_seq);
		current_seq = -1;
	
	alarm[1] = seq_time;