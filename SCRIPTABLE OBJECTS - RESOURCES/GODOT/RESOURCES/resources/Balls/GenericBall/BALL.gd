extends KinematicBody2D
class_name PachinkoBall
var ballResource : BallResource

# TITLE : BALL
# Functions : _on_BALL_body_shape_entered, ResolvePegHit, _physics_process,
#		_on_GENERIC_BALL_transferResources, _on_GENERIC_BALL_changeToStatic,
#		_on_GENERIC_BALL_stopBouncing, _on_GENERIC_BALL_startBouncing,
#		_on_GENERIC_BALL_draggable, _input, _on_GENERIC_BALL_flipGravity
# 		_on_GENERIC_BALL_setTeam
# Purpose : To control the Kinameaticbody of the ball
# Closely Connected Scripts : GenericBall, abilitiesInfoContainer, addText,
#		addTexture, BallInfo


# Connected To : addText
# Purpose : sets text
signal addText(name)


# Connected To : addTexture
# Purpose : sets texture
signal addTexture(texture)


# Connected To : abilitiesInfoContainer
# Purpose : sets up labels
signal addInfo(abilitiesInfo)


# Connected To : BallInfo
# Purpose : tells if being dragged
signal beingDragged(isBeingDragged)


# Connected To : BallInfo
# Purpose : turns off labels
signal turnOff


var rightSpot := false
var hitFor : int
var payloadDictionary := {}
var dragging := false
var click_radius := 10
var draggable := false
var stopBouncing := false


# Recieved From : 
# Purpose : checks if what is hit is a peg
func _on_BALL_body_shape_entered(_body_id, body, _body_shape, _local_shape):
	if(body.is_in_group("Pegs")):
		ResolvePegHit(body)


# Recieved From : GenericBall
# Purpose : allows ball to be dragged
func _on_GENERIC_BALL_draggable(canBeDragged : bool):
	self.draggable = canBeDragged


# Recieved From : TransferResources
# Purpose : adds the ball's resorces to this
func _on_GENERIC_BALL_transferResources(newResource : BallResource):
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


# Recieved From : GenericBall
# Purpose : sets mode to static
func _on_GENERIC_BALL_changeToStatic():
	self.set_deferred("mode",RigidBody2D.MODE_STATIC)


# Recieved From : 
# Purpose : sets position to this
func _on_BALL_mouse_entered():
	if(self.mode != RigidBody2D.MODE_STATIC):
		get_parent().get_child(1).global_position = self.global_position


# Purpose : sets position of labels to this
func _physics_process(_delta : float):
	get_parent().get_child(1).global_position = self.global_position


# Recieved From : GenericBall
# Purpose : sets ball team
func _on_GENERIC_BALL_setTeam(team : String):
	self.add_to_group(team)


# Recieved From : GenericBall
# Purpose : flips ball gravity
func _on_GENERIC_BALL_flipGravity():
	self.gravity_scale = -1 * self.gravity_scale


# Recieved From : GenericBall
# Purpose : remove physics material
func _on_GENERIC_BALL_stopBouncing():
	stopBouncing = true
	self.set_physics_material_override(null)


# Recieved From : GenericBall
# Purpose : resets physics material
func _on_GENERIC_BALL_startBouncing():
		self.set_physics_material_override(ballResource.physicsMaterial)


# Purpose : Drag manager
func _input(event : InputEvent):
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


# Purpose : resolves peg hits
func ResolvePegHit(peg : Peg):
	if(peg.has_method("addHit")):
		peg.addHit(hitFor)
