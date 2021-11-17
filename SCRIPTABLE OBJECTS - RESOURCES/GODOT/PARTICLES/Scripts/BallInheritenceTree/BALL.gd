extends RigidBody2D
class_name PachinkoBall

export(Resource) var ballResource

signal addText(name, description)
signal addTexture(texture)

var hitFor
var payloadDictionary = {}


func _ready():
	var resource = ballResource as BallResource
	hitFor = resource.hitsFor
	payloadDictionary = resource.payload
	gravity_scale = resource.gravityScale
	scale.x = resource.size
	scale.y = resource.size
	set_physics_material_override(resource.physicsMaterial)
	emit_signal("addText", resource.name, resource.description)
	emit_signal("addTexture", resource.texture)


func _on_BALL_body_shape_entered(body_id, body, body_shape, local_shape):
	if(body.is_in_group("Pegs")):
		ResolvePegHit(body);


func ResolvePegHit(peg):
	if(peg.has_method("addHit")):
		peg.addHit(hitFor)

func flipGravity():
	self.gravity_scale = -1 * self.gravity_scale

func _physics_process(delta):
	get_parent().get_child(0).global_position = self.global_position
