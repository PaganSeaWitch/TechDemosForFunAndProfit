extends ProgressBar

var styleboxEdge = load("res://resources/Styles/progressBarForegrounEdge.tres")
func _process(_delta):
	if(self.ratio <= .96):
		self.add_stylebox_override("fg", styleboxEdge)



func _on_EnemyPanel_sendHealthToBar(currentHealth, maxHealth):
	if(max_value != maxHealth):
		max_value = maxHealth
	value = currentHealth
