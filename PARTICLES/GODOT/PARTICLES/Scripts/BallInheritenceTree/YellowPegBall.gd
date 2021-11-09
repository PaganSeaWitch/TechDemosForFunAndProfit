extends PachinkoBall
class_name YellowPegBall

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	worksOn = YellowPeg

func _on_BALL_body_shape_entered(body_id, body, body_shape, local_shape):
	._on_BALL_body_shape_entered(body_id, body, body_shape, local_shape)
	if(body is worksOn):
		self.ResolvePegHit(body)
	


