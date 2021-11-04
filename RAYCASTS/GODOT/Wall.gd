extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody_acceptable_raycast_hit(payload):
	self.translate(payload)
