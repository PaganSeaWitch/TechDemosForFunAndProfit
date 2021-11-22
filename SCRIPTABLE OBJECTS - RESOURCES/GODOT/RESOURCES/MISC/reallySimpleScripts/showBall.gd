extends Control


export(int) var pos 




func _on_EnemyPanel_setBall(ball, index):
	if(index == pos):
		self.remove_child(self.get_child(0))
		var newBall = ball.instance()
		newBall.changeToStatic = true
		self.add_child(newBall)

