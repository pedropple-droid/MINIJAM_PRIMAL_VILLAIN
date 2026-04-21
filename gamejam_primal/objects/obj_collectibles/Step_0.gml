//Doesn't allow passing here if paused ingame
	if global.pause
	{
		exit;
	}

//Collectible spawner handler
	spawn_timer -= 1;

	if(spawn_timer <= 0)
	{
		spawn_timer = 150;
		
		//Spawner variables
		var seq_time = 80;
		var predict_time = 40;
		
		var lane_variation = choose(-1, 0, 1);
		var lane_target = clamp(obj_bugu.lane_index + lane_variation, 0, array_length(lanes) - 1);
		
		var future_x = obj_bugu.x + obj_bugu.hspd * predict_time;
		var future_y = lanes[lane_target];
		
		//Area between current and future position
		var min_x = min(obj_bugu.x, future_x) - 130;
		var max_x = max(obj_bugu.x, future_x) + 130;

		//Pick spawn position
		spawn_x = irandom_range(min_x, max_x);
		spawn_y = future_y;
		
		current_seq = layer_sequence_create("Instances", spawn_x, spawn_y, seq_collectibleShadow);
		alarm[0] = seq_time;
	};