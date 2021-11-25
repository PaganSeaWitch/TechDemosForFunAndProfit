extends Control


export(int) var pos 




func _on_EnemyPanel_setBall(ball, index):
	if(index == pos):
		if(self.get_child_count() != 0):
			self.remove_child(self.get_child(0))
		var newBall = ball.instance()
		newBall.ballIsStatic = true
		self.add_child(newBall)
		match(index):
			0:
				newBall.get_child(1).position.x = newBall.get_child(1).position.x + 115
			1:
				newBall.get_child(1).position.x = newBall.get_child(1).position.x + 75
			2:
				newBall.get_child(1).position.x = newBall.get_child(1).position.x + 35


func _on_EnemyPanel_clearBalls():
	if(self.get_child_count() != 0):
		self.remove_child(self.get_child(0))
