extends Popup

# TITLE : ReservePopup
# Functions : _on_ReserveButton_pressed, _on_Button_pressed
#		_on_discordButton_pressed
# Purpose : To show popup on button click
# Closely Connected Scripts : 


# Recieved From : 
# Purpose : makes popup visible
func _on_ReserveButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))


# Recieved From : 
# Purpose : makes popup invisible
func _on_Button_pressed():
	self.visible = false


# Recieved From : 
# Purpose : makes popup visible
func _on_discordButton_pressed():
	if(visible == false):
		self.popup_centered(Vector2(800, 800))
