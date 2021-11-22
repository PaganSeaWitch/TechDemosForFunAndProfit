extends RigidBody2D
class_name PachinkoBall
var ballResource : BallResource
signal addText(name)
signal addTexture(texture)
signal addInfo(abilitiesInfo)

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


func _on_GENERIC_BALL_transferResources(ballResource):
	self.ballResource = ballResource
	var resource = ballResource as BallResource
	hitFor = resource.hitsFor
	payloadDictionary = resource.initalPayload
	gravity_scale = resource.gravityScale
	set_physics_material_override(resource.physicsMaterial)
	emit_signal("addText", resource.name)
	emit_signal("addTexture", resource.texture)
	get_child(0).set_scale(resource.scale)
	emit_signal("addInfo", resource.abilitiesInfo)

func _on_GENERIC_BALL_changeToStatic():
	self.mode = RigidBody2D.MODE_STATIC


func _on_BALL_mouse_entered():
	if(self.mode != RigidBody2D.MODE_STATIC):
		get_parent().get_child(1).global_position = self.global_position
