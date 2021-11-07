extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"








func _on_BALL_body_entered(body):
	print("something explodes")
	if(body.has_method("explode")):
		print("something explodes")
		body.explode()
