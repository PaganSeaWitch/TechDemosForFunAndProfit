extends Control


export(Resource) var abilityInfoResource

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).text = String(abilityInfoResource.amount)
	get_child(1).texture = abilityInfoResource.type
	if(abilityInfoResource.perAmount == 0):
		get_child(2).text = ""
	else:
		get_child(2).text = "Per " + String(abilityInfoResource.perAmount)
		var newPeg = abilityInfoResource.peg.instance()
		newPeg.collision_layer = 0
		newPeg.collision_mask = 0
		get_child(3).add_child(newPeg)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
