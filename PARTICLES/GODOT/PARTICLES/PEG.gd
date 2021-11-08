extends StaticBody2D



func explode():
	if(self.get_child(0).get_child(0).emitting == false):
		self.get_child(0).get_child(0).emitting = true

