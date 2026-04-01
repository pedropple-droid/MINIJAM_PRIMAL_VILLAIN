//Create obstacle
	//Time till destroy rock and start next sequence
		var seq_time = 10;
		
	//Decide on obstacle and collision
		obst = obj_rock;
	
	//Create chosen obstacle
		var obstCrt = instance_create_layer(spawn_x, spawn_y, "Instances", obst);
	
	//Effect handler
		cam_shake = 5;
	
	//Destroy sequence
		layer_sequence_destroy(fallrock_seq);
		current_seq = -1;
	
	alarm[2] = seq_time;