extends Resource
class_name BallResource

export(PhysicsMaterial) var physicsMaterial
export(Texture) var texture
export(int) var gravityScale
export(int) var size
export(Dictionary) var payload
export(int) var hitsFor
export(String, MULTILINE) var name
export(String, MULTILINE) var description
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _init(gravityScale = 0, size = 1, payload = {}, physicsMaterial = null,texture = null, hitsFor = 0, name = "", description = ""):
	self.gravityScale = gravityScale
	self.size = size
	self.payload = payload
	self.physicsMaterial = physicsMaterial
	self.hitsFor = hitsFor
	self.description = description
	self.name = name
	self.texture = texture
