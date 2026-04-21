//Creates falling sequence
	//Time till collectible fall
		var seq_time = 45;
		
	//Create chosen obstacle
		seq_collect = seq_fallingCollectible;
		collectible_seq = layer_sequence_create("Instances", spawn_x, spawn_y, seq_collect);
	
	//Destroy sequence
		layer_sequence_destroy(current_seq);
		current_seq = -1;
	
	alarm[1] = seq_time;