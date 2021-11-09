extends RigidBody2D
class_name PachinkoBall


var hitAmt
var payloadDictionary = {}


func _ready():

	hitAmt = 1


func _on_BALL_body_shape_entered(body_id, body, body_shape, local_shape):
	if(body.is_in_group("Pegs")):
		ResolvePegHit(body);


func ResolvePegHit(peg):
	if(peg.has_method("emit")):
		peg.emit()
	if(peg.has_method("addHit")):
		peg.addHit(hitAmt)

func flipGravity():
	self.gravity_scale = -1 * self.gravity_scale
