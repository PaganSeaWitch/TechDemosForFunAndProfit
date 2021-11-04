extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(Input.is_action_just_pressed("left")):
		self.translate( Vector3(-1,0,0))
	if(Input.is_action_just_pressed("right")):
		self.translate( Vector3(1,0,0))
	if(Input.is_action_just_pressed("forward")):
		self.translate( Vector3(0,1,0))
	if(Input.is_action_just_pressed("back")):
		self.translate( Vector3(0,-1,0))
	if(Input.is_action_just_pressed("up")):
		self.translate( Vector3(0,0,1))
	if(Input.is_action_just_pressed("down")):
		self.translate( Vector3(0,0,-1))
