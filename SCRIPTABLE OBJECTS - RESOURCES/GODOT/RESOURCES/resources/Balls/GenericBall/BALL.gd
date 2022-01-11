extends RigidBody2D
class_name PachinkoBall
var ballResource : BallResource
signal addText(name)
signal addTexture(texture)
signal addInfo(abilitiesInfo)
signal beingDragged(isBeingDragged)
signal turnOff


var rightSpot = false
var hitFor
var payloadDictionary = {}
var dragging = false
var click_radius = 10
var draggable = false
var stopBouncing = false

func _on_BALL_body_shape_entered(_body_id, body, _body_shape, _local_shape):
	if(body.is_in_group("Pegs")):
		ResolvePegHit(body)


func ResolvePegHit(peg):
	if(peg.has_method("addHit")):
		peg.addHit(hitFor)


func _on_GENERIC_BALL_transferResources(newResource):
	ballResource = newResource as BallResource
	hitFor = ballResource.hitsFor
	payloadDictionary = ballResource.currentPayload
	gravity_scale = ballResource.gravityScale
	if(!stopBouncing):
		set_physics_material_override(ballResource.physicsMaterial)
	emit_signal("addText", ballResource.name)
	emit_signal("addTexture", ballResource.texture)
	get_child(0).set_scale(ballResource.scale)
	emit_signal("addInfo", ballResource.abilitiesInfo)



func _on_GENERIC_BALL_changeToStatic():
	self.set_deferred("mode",RigidBody2D.MODE_STATIC)


func _on_BALL_mouse_entered():
	if(self.mode != RigidBody2D.MODE_STATIC):
		get_parent().get_child(1).global_position = self.global_position

func _physics_process(_delta):
	get_parent().get_child(1).global_position = self.global_position

func _on_GENERIC_BALL_setTeam(team):
	self.add_to_group(team)


func _on_GENERIC_BALL_flipGravity():
	self.gravity_scale = -1 * self.gravity_scale


func _on_GENERIC_BALL_stopBouncing():
	stopBouncing = true
	self.set_physics_material_override(null)


func _on_GENERIC_BALL_startBouncing():
		self.set_physics_material_override(ballResource.physicsMaterial)


func _input(event):
	if(event is InputEventMouseButton && event.button_index == BUTTON_LEFT):
		if (event.position - self.global_position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging && event.pressed && draggable:
				emit_signal("beingDragged", true)
				dragging = true
				self.gravity_scale = 0
				self.collision_layer = 2
				self.collision_mask = 2
				self.linear_velocity = Vector2(0,0)
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			self.collision_layer = 1
			self.collision_mask = 1
			emit_signal("turnOff")
			dragging = false
			emit_signal("beingDragged", false)
			self.gravity_scale = self.ballResource.gravityScale
			if(rightSpot == false):
				self.position = Vector2(0,0)
			else:
				self.linear_velocity = Vector2(0, 100)
				self.applied_force = Vector2(0, 100)
				self._on_GENERIC_BALL_startBouncing()
				BallCountSingleton.increaseBallCount()
				self.draggable = false
	if event is InputEventMouseMotion && dragging && draggable:
		# While dragging, move the sprite with the mouse.
		self.global_position = event.position
		self.linear_velocity = Vector2(0,0)


func _on_GENERIC_BALL_draggable(canBeDragged):
	self.draggable = canBeDragged

