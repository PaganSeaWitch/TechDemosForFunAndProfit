extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ReserveButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))


func _on_Button_pressed():
	self.visible = false


func _on_discordButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))
