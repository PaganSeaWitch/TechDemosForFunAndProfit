extends StaticBody2D



func _on_Area2D2_body_exited(body):
	self.collision_layer = 1
	self.collision_mask = 1
	self.visible = true
	body.set_linear_velocity(Vector2(0, 10))
	get_tree().call_group("BallCarrier", "moveCarrier")
