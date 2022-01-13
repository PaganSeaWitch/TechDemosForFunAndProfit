extends ScrollContainer

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scroll = false


func _process(delta):
	if(scroll):
		if(Input.is_action_pressed("ScrollUp") || Input.is_mouse_button_pressed(BUTTON_WHEEL_UP)):
			scroll_vertical = scroll_vertical - (500 * delta)
		if(Input.is_action_pressed("ScrollDown")|| Input.is_mouse_button_pressed(BUTTON_WHEEL_DOWN)):
				scroll_vertical = scroll_vertical + (500 * delta)


func _on_Control_visibility_changed():
	scroll = !scroll
