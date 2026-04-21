// Variable
	global.can_restart = false;

// Initialize a variable to track if we've already started the timer
	spawn_text_timer = false;

// Define the function once
	show_restart_text = function() 
	{
	    global.can_restart = true; // A flag to tell the Draw event it's okay to show the text
	};