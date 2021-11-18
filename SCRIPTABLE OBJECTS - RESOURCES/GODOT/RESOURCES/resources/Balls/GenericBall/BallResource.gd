extends Resource
class_name BallResource

export(PhysicsMaterial) var physicsMaterial
export(Texture) var texture
export(int) var gravityScale = 10
export(Vector2) var scale = Vector2(10,10)
export(Dictionary) var payload
export(int) var hitsFor
export(String, MULTILINE) var name
export(String, MULTILINE) var description


# Called when the node enters the scene tree for the first time.
func _init(gravityScale = 10, scale = Vector2(10,10), payload = {}, physicsMaterial = null,texture = null, hitsFor = 1, name = "", description = ""):
	self.gravityScale = gravityScale
	self.scale = scale
	self.payload = payload
	self.physicsMaterial = physicsMaterial
	self.hitsFor = hitsFor
	self.description = description
	self.name = name
	self.texture = texture
