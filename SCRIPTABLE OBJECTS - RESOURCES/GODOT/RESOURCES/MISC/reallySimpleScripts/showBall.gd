extends Control

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


export(int) var pos 



#adds a ball at a specific index to the enemy panel
func _on_EnemyPanel_setBall(ball, index):
	if(index == pos):
		if(self.get_child_count() != 0):
			self.remove_child(self.get_child(0))
		var newBall = ball.instance()
		newBall.ballIsStatic = true
		self.add_child(newBall)
		#this will break if the ball scene is changed at the information panel nodes
		match(index):
			0:
				newBall.get_child(1).get_child(0).rect_position.x = newBall.get_child(1).get_child(0).rect_position.x + 115
			1:
				newBall.get_child(1).get_child(0).rect_position.x = newBall.get_child(1).get_child(0).rect_position.x + 75
			2:
				newBall.get_child(1).get_child(0).rect_position.x = newBall.get_child(1).get_child(0).rect_position.x + 35

#removes all balls from the enemy turn panel
func _on_EnemyPanel_clearBalls():
	if(self.get_child_count() != 0):
		self.remove_child(self.get_child(0))
