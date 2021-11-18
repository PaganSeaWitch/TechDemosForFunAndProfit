extends ProgressBar

var styleboxEdge = load("res://resources/Styles/progressBarForegrounEdge.tres")
func _process(delta):
	if(self.ratio <= .96):
		self.add_stylebox_override("fg", styleboxEdge)

