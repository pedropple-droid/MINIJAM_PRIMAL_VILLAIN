//Get player input
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_down = keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(ord("W"));
	key_off = keyboard_check_released(ord("S")) || keyboard_check_released(ord("W"))

//Calculate movement
	var move = key_right - key_left;
	
	hspd = move * walkspd;

//Check sprite
	if move == 1 { sprtdir = 1 }
	if move == -1 { sprtdir = -1 }
	
	image_xscale = sprtdir
	
//Collision handler
	if place_meeting( x, y, obj_rock)
	{
		hspd = 0	
	};

	x += hspd;


//Calculate lane
	if key_up{target_y -= 64};
	if key_down{target_y += 64};
	if key_off {target_y = 544 };
	
//Lane Handler
	y = lerp( y, target_y, 0.2);
	if abs( y - target_y ) < 1 { y = target_y; }