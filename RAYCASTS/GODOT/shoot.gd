extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hit(id)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


const ray_length = 1000

func _physics_process(delta):
	if (Input.is_action_just_pressed("click")):
		var space_state = get_world().direct_space_state
		var from = self.project_ray_origin(get_viewport().get_mouse_position())
		var to = from + self.project_ray_normal(get_viewport().get_mouse_position()) * ray_length
		var result = space_state.intersect_ray(from, to)
		if(result.empty() == false):
			if(result.collider.is_in_group("hittable")):
				var hitType: PlayerHit
				hitType = preload("res://PlayerHit.gd").new();
				result.collider.hit(hitType)
