//Creates fallen collectible
	//Collectible variable
		collectible = obj_ruby;
	
	//Create chosen collectible
		var clCrt = instance_create_layer(spawn_x, spawn_y, "Instances", collectible);
	
	//Destroy sequence
		layer_sequence_destroy(collectible_seq);
		collectible_seq = -1;