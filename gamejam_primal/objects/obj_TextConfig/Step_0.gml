//Inputs handler

	keyboard_check_pressed(ord("W") || vk_up) 
	{
		index--;
		if(index < 1) index = op_max - 2;
	}
	
	keyboard_check_pressed(ord("W") || vk_down) 
	{
		index++;
		if(index > op_max -2) index = 1	
	}

//Config index handler

	if(index == 0)
	{
		//Placeholder index
	};
	
	//Music configuration
  	if keyboard_check_pressed(vk_left)
		{
			global.nag1 = 1
		}
		if keyboard_check_pressed(vk_right)
		{
			global.nag1 = 0
		};	
	
	//FX configuration
	
	if(index == 2)
	{
		if keyboard_check_pressed(vk_left)
		{
			global.nag2 = 1
		}
		if keyboard_check_pressed(vk_right)
		{
			global.nag2 = 0
		}	
	};
	
	if(index == 3)
	{
		//Placeholder index
	};


