//Check for framing in life HUD
	//Player variable
	var _player = instance_find(obj_bugu, 0)
	
	if (_player.meat <= 0) frame = 8 //Death frame
	else
	{
		var base = _player.hasEgg ? 0 : 4;
		var offset = 3 - _player.meat;
		frame = base + offset;
	}
	
//Draws the life hud
	draw_sprite_ext(spr_Hud, frame, 5, 5, 3, 3, 0, c_white, 1)
