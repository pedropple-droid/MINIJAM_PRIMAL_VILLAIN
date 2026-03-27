//Spawner variables

	var lane = choose(lanes[0], lanes[1], lanes[2]);
	var xx = irandom(room_width);
	
	
//Spawner handler
	
	spawn_timer -= 0.1;
	
	if(spawn_timer <= 0)
	{
		spawn_timer = 10
		
		var obstacle = instance_create_layer(xx, lane, "Instances", obj_falling);
		obstacle.depth = -1;
	};