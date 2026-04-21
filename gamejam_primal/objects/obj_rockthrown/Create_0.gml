//Randomise set seed
	randomise()

//Main variables
	lanes = [500, 564, 628];
	cam_shake = 0;
	spdMult = 1;
	
//Timing logic
	spawn_timer = 0;
	warning_duration = 80;   // How long the shadow stays on ground
	cooldown_duration = 120; // Time to wait AFTER the rock hits before next spawn
	predict_time = 100;      // How far into the future we aim

//Main structs
	global.occupied_cells = {};