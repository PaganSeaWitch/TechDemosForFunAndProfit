extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var changeColor = false

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var red = rand_range(0, 1);
	var green = rand_range(0, 1);
	var blue = rand_range(0, 1);
	if(changeColor):
		self.set_frame_color(Color(red, green, blue, 1))

func _on_ColorRect_mouse_entered():
	changeColor = true
	



func _on_ColorRect_mouse_exited():
	changeColor = false
