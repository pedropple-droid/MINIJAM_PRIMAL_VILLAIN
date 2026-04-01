//Check for pause
	if global.pause {sprite_index = idle_sprt_bugu exit;}
	if (room != Room1) exit;

//Get player input
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_down = keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(ord("W"));
	key_off = keyboard_check_released(ord("S")) || keyboard_check_released(ord("W"))

//Death handler
	if !hasEgg && meat <= 0 
	{
		image_blend = make_colour_hsv( 0, 0, 0 );
		exit;
	}
	
//Movement variable
	var _move = key_right - key_left;
	 
	if (!is_being_thrown) hspd = _move * walkspd;

//Check sprite
	if (_move != 0) sprtdir = sign(_move);

	if invulTimer == 0
	{
		image_blend = base_color;
		
		if (_move != 0) sprite_index = walk_sprt_bugu
		else sprite_index = idle_sprt_bugu
	}
	else 
	{
		sprite_index = hit_sprt_bugu
		image_blend = make_colour_hsv(255, 255, random(255))
	};
	 
	image_xscale = sprtdir
	
//Camera Handler

	//Advanced Movement Variables
		var _viewX = camera_get_view_x(view_camera[0]);
		var _viewW = camera_get_view_width(view_camera[0]);
		var _gotoX = x + (_move * 50) - (_viewW * 0.5);
		var _newX = lerp(_viewX, _gotoX, 0.2);
	
	//Camera ViewPos
		camera_set_view_pos(view_camera[0], _newX, y)
		
//Game Handler

	//Useful variables
	currLane = lane_index //Used for depth check
	obstacles = [obj_explodingrock]
	hazards = [obj_geyser, obj_rock]

	//Collision handler
		//Horizontal
		if place_meeting( x, y, obstacles ) hspd = 0;
		
		if place_meeting( x, y, hazards )
		{
			if invulTimer <= 0
			{
				invulTimer = invulDuration;
			
				if hasEgg
				{
					with obj_egg
					{
						isThrown = true;
				        t = 0;

				        start_x = x;
				        start_y = y;

				        lane_variation = choose(-1, 0, 1);
				        lane_target = clamp(lane_index + lane_variation, 0, array_length(lanes) - 1);
						
						randomDir = choose( x - (other.sprtdir * irandom_range(200, 600)) , x + (other.sprtdir * irandom_range(200, 600)))
				        future_x = randomDir
				        future_y = lanes[lane_target];
					}
					
					hasEgg = false
				}
				else meat -= 1;
			
				is_being_thrown = true;
				throw_bugu_x = x - (sprtdir * 100);
			};
		};
		
		if (place_meeting( x, y, obj_egg) && !hasEgg) hasEgg = true
		
		if (!is_being_thrown) x += hspd;
		
	//Lerp handler
		if is_being_thrown
		{
			x = lerp(x, throw_bugu_x, 0.1);
				
			if abs(x - throw_bugu_x) < 1
			{
				is_being_thrown = false;
			}
		}
	
	//Calculate lane
		var new_lane = lane_index
		
		if (y == target_y)
		{
			if (key_up) new_lane -= 1;
			if (key_down) new_lane += 1;
		};
		
		//Clamp
			new_lane = clamp(new_lane, 0, array_length(lanes) - 1);
		
		//Check for obstacles in target 
			var blocked = place_meeting(x, lanes[new_lane], obstacles);
		
		//Commit lane change
			if (!blocked && y == target_y)
			{
				lane_index = new_lane;
				target_y = lanes[lane_index];
			};
		
		//Lerp movement handler
			y = lerp( y, target_y, 0.3);
			if (abs(y - target_y) < 1) y = target_y;
		
	//Damage handler
		//Invulnerable timer handler
			if (invulTimer > 0) invulTimer -= 1;
		
	//Debug handler
		if (keyboard_check_pressed(vk_space)) global.life += 1	