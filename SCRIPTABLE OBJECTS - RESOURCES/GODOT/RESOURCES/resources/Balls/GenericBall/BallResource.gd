extends Resource
class_name BallResource

export(PhysicsMaterial) var physicsMaterial
export(Texture) var texture
export(int) var gravityScale = 10
export(Vector2) var scale = Vector2(10,10)
export(Dictionary) var initalPayload
export(int) var hitsFor
export(String, MULTILINE) var name
export(Array, Resource) var abilitiesInfo
export(Array, Resource) var outcomes
var currentPayload = {}
# Called when the node enters the scene tree for the first time.
func _init(gravityScale = 10, scale = Vector2(10,10), initalPayload = {}, physicsMaterial = null,texture = null, hitsFor = 1, name = "", abilitiesInfo = [], outcomes = []):
	self.gravityScale = gravityScale
	self.scale = scale
	self.initalPayload = initalPayload
	self.physicsMaterial = physicsMaterial
	self.hitsFor = hitsFor
	self.name = name
	self.texture = texture
	self.abilitiesInfo = abilitiesInfo
	self.outcomes = outcomes
	self.currentPayload = initalPayload.duplicate(true)

