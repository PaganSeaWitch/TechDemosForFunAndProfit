extends BallResource
class_name ActionBallResource

export(Array) var worksOnArray


# Called when the node enters the scene tree for the first time.
func _init(worksOnArray = []):
	self.worksOnArray = worksOnArray
