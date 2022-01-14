extends ScrollContainer

# TITLE : AutoScroll
# Functions : _process, _on_Control_visibility_changed
# Purpose : Scrolls ability list automatically
# Closely Connected Scripts :  



var scroll := false

# Recieved From : 
# Purpose : sets scrolling on
func _on_Control_visibility_changed():
	scroll = !scroll

# Purpose : automatically scrolls the abilities
func _process(delta):
	if(scroll):
		if(Input.is_action_pressed("ScrollUp") || Input.is_mouse_button_pressed(BUTTON_WHEEL_UP)):
			scroll_vertical = scroll_vertical - (500 * delta)
		if(Input.is_action_pressed("ScrollDown")|| Input.is_mouse_button_pressed(BUTTON_WHEEL_DOWN)):
				scroll_vertical = scroll_vertical + (500 * delta)
