extends Resource
class_name EnemyResource

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, MULTILINE) var name
export(String, MULTILINE) var description
export(Texture) var texture
export(Array, Resource) var moves
export(int) var health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(health = 10, texture = null, moves = [], name = "", description = ""):
	self.health = health
	self.texture = texture
	self.moves = moves
	self.name = name
	self.description = description
