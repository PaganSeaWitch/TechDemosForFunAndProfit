extends RigidBody2D
class_name PachinkoBall
var ballResource : BallResource
signal addText(name, description)
signal addTexture(texture)
var hitFor
var payloadDictionary = {}


func _on_BALL_body_shape_entered(body_id, body, body_shape, local_shape):
	if(body.is_in_group("Pegs")):
		ResolvePegHit(body);


func ResolvePegHit(peg):
	if(peg.has_method("addHit")):
		peg.addHit(hitFor)


func flipGravity():
	self.gravity_scale = -1 * self.gravity_scale


func _physics_process(delta):
	get_parent().get_child(1).global_position = self.global_position


func _on_GENERIC_BALL_transferResources(ballResource):
	self.ballResource = ballResource
	var resource = ballResource as BallResource
	hitFor = resource.hitsFor
	payloadDictionary = resource.initalPayload
	gravity_scale = resource.gravityScale
	set_physics_material_override(resource.physicsMaterial)
	emit_signal("addText", resource.name, resource.description)
	emit_signal("addTexture", resource.texture)
	get_child(0).set_scale(resource.scale)
