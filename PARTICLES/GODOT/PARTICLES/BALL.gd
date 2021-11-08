extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"











func _on_BALL_body_shape_entered(body_id, body, body_shape, local_shape):
	print("something explodes")
	if(body.has_method("explode")):
		print("something explodes")
		body.explode()
