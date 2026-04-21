//MAJOR CHECK
if (instance_exists(obj_bugu))
{
	//Doesn't allow passing here if paused ingame
		if global.pause
		{
			exit;
		};

	//Checks for game_over restart
		if global.game_over
		{
			if (keyboard_check_pressed(vk_space))
			{
				room_restart()
				global.game_over = false
				obj_death.spawn_text_timer = false
			}
			if(keyboard_check_pressed(vk_escape))
			{
				global.game_over = false
				obj_death.spawn_text_timer = false
				room_goto(rm_mainmenu)
			}
			exit
		}

	//Check for multi
		if (global.multi_timer <= 0) 
		{
			global.score_multiplier = 1;
			global.multi_timer = 0;
		}
		else
		{
			global.multi_timer -= 1
		};

	//Events for sides of the screen
		//Variables
		var _leftW = room_width / 3.6;
		var _rightW = room_width - _leftW;
		var _trex = obj_trex

		if (obj_bugu.x < _leftW || obj_bugu.x > _rightW)
		{
			if !instance_exists(_trex) 
			{
				var _spawn_x;
		
				if (obj_bugu.x < _leftW) 
				{
		            _spawn_x = -350; // Left side, off-screen
		        } else {
		            _spawn_x = room_width + 350; // Right side, off-screen
		        };
				instance_create_layer(_spawn_x, 384, "Instances", _trex)
			};
		};
};