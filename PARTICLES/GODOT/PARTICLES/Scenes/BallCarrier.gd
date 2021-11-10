extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var positionToCatch : Vector2
var to : Vector2
var currentContainer = 1
var maxContainers = 4
var from
var ballDropped = false
var baseIncrement = 100
signal dropNext
# Called when the node enters the scene tree for the first time.
func _ready():
	to = Vector2(1054.036,953.508)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func moveCarrier():
	currentContainer = currentContainer + 1
	if(currentContainer <= maxContainers):
		from = get_child(currentContainer)
		ballDropped = false

func moveTo(from, to, delta):
	var increment = baseIncrement * delta
	if(from != null):
		if(from.global_position.x > to.x):
			self.position.x = self.position.x -increment
		if(from.global_position.x <= to.x && ballDropped == false):
			ballDropped = true
			self.emit_signal("dropNext")

func _physics_process(delta):
	moveTo(from,to, delta)
