//Rock shake timer
	cam_shake = 6;
	
//Create hazard
	instance_create_layer(spawn_x, spawn_y, "Instances", obj_rock_hzrd);
	layer_sequence_destroy(obj_rock_hzrd)

//Destroy sequence
	layer_sequence_destroy(fallrock_seq);
	fallrock_seq = -1;

//Choose obstacle
	var curr_obst = choose(obj_rock_obst, obj_explodingrock)
	instance_create_layer(spawn_x, spawn_y, "Instances", curr_obst);


//Adds to spawn timer 
	spdMult += 0.2