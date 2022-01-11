extends Popup




func _on_ReserveButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))


func _on_Button_pressed():
	self.visible = false


func _on_discordButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))
