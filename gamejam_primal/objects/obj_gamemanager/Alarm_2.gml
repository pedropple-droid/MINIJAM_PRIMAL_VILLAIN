//Destroy rock
	instance_destroy(obst)
	
//Create geyser
	//Gloval variables
		xpld = obj_explodingrock
	
	//Local variables
		var geyserCrt = instance_create_layer(spawn_x, spawn_y, "Instances", xpld);
		
	if (obj_bugu.lane_index <= 0) xpld.depth = -1
	if (obj_bugu.lane_index > 0) xpld.depth = 1