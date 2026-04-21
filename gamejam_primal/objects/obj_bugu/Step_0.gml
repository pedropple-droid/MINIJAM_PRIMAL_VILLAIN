//General handler
	//Death check
		if sprite_index == sprt_death exit

	//Check for pause
		if global.pause {sprite_index = idle_sprt_bugu exit;}
		if (room != rm_game) exit;

	//Get player input
		var key_left = keyboard_check(global.key_left) ;
		var key_right = keyboard_check(global.key_right);
		var key_down = keyboard_check(global.key_down);
		var key_up = keyboard_check(global.key_up);

	//Movement variable
		var _move = key_right - key_left;
	 
		if (!is_being_thrown) hspd = _move * walkspd;

	//Check sprite
		if (_move != 0 && invulTimer == 0) sprtdir = sign(_move); //Faces the sprite

		if (invulTimer == 0)
		{
			image_blend = base_color;
			//Death handler
			if !hasEgg && meat <= 0 
			{	
				sprite_index = sprt_death
				
				//SOUND
				var _emitter1 = audio_emitter_create();
				var _emitter1_bus = audio_bus_create();
				audio_emitter_bus(_emitter1, _emitter1_bus);
	
				//Creation of audio bus and sound play
				_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Bitcrusher,	
				{
					gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
				});
	
				audio_play_sound_on(_emitter1, snd_buguhurt, 0, 10, choose(0.8, 1) , 0, random_range(0.75, 1.25))
				//SOUND
				
				exit
			}; 
			
			if (_move != 0) 
			{
				sprite_index = walk_sprt_bugu
				if (hasEgg)
				{
				global.player_score += 0.1;
				};
			} 
			else sprite_index = idle_sprt_bugu
		} else {
			sprite_index = hit_sprt_bugu
			image_blend = make_colour_hsv(255, 255, random(255))
		}; 
	 
		image_xscale = sprtdir
	
//Camera Handler
	//Advanced Movement Variables
		var _buguX = obj_bugu.x
		var _viewX = camera_get_view_x(view_camera[0]);
		var _viewW = camera_get_view_width(view_camera[0]);
		if (invulTimer == 0) var _gotoX = x + (_move * 50) - (_viewW * 0.5)
		else _gotoX = _buguX - (_viewW * 0.5);
		var _newX = lerp(_viewX, _gotoX, 0.2);
	
	//Camera ViewPos
		camera_set_view_pos(view_camera[0], _newX, y)
		
//Game Handler

	//Useful variables
		currLane = lane_index //Used for depth check
		obstacles = [obj_explodingrock, obj_rock_obst]
		hazards = [obj_geyser, obj_rock_hzrd, obj_arrow, obj_trex]

	//Collision handler
		//Horizontal
		var _target_hspd = _move * walkspd;

		//If has touched an obstacle
		if (place_meeting(x + _target_hspd, y, obstacles)) 
		{
			while (!place_meeting(x + sign(_target_hspd), y, obstacles))
			{
				x += sign(_target_hspd)
			};
			hspd = 0;
		};
		
		//If has touched a hazard
		if (place_meeting(x, y, hazards))
		{
			if invulTimer <= 0
			{
				invulTimer = invulDuration;
				//SOUND
				var _emitter1 = audio_emitter_create();
				var _emitter1_bus = audio_bus_create();
				audio_emitter_bus(_emitter1, _emitter1_bus);
	
				//Creation of audio bus and sound play
				_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Bitcrusher,	
				{
					gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
				});
	
				audio_play_sound_on(_emitter1, snd_buguhurt, 0, 10, choose(0.1, 0.2), 0, random_range(0.75, 1.25))
				//SOUND
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
					};
					
					hasEgg = false
				}
				else 
				{
					meat -= 1;
				};
				is_being_thrown = true;
				throw_bugu_x = x - (sprtdir * 100);
				audio_play_sound(snd_buguhurt, 0, false, 0, 0, choose(0.1, 0.4 ))
			};
		};
		
		if (place_meeting(x, y, obj_egg) && !hasEgg) hasEgg = true
		
		if (!is_being_thrown) 
		{
			x += hspd; //He moves through this code, lol
		}
		
		else
		{
		    var _nextX = lerp(x, throw_bugu_x, 0.1);
    
			//Check for obstacle to stop lerping
		    if (place_meeting(_nextX, y, obstacles)) is_being_thrown = false;
		    else x = _nextX;
			
		    if (abs(x - throw_bugu_x) < 1) is_being_thrown = false;
		};
	
//Calculate lane
	//Variables
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

//Room constraint
	var _sprtW = sprite_width / 2
	
	x = clamp(x, 0 - _sprtW, room_width - _sprtW);

//Debug handler
	if (keyboard_check_pressed(vk_space)) 
	{
		if (meat < 3) meat += 1;
	};
	
	if (keyboard_check_pressed(vk_f1)) 
	{
		if (meat > 0) meat -= 1;
	};