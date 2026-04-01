//Main gameplay variables
	//Bugu original color
	base_color = image_blend;
	
	//Movement
	hspd = 0;
	vspd = 10;
	walkspd = 4;
	
	//Lane Changing
	lane_index = 0;
	lanes = [480, 544, 608];
	target_y = lanes[lane_index];
	
	//Sprite
	sprtdir = 1;
	depth = -1;
	
	//Gameplay
		//Hit life handler
		hasEgg = true;
		meat = 3;
		gotHit = false;
		invulTimer = 0;
		invulDuration = 60;
		//Hit lerp handler
		is_being_thrown = false;
		throw_bugu_x = x;