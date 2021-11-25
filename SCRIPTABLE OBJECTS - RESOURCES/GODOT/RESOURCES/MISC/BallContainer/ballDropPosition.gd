extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrayOfBalls = []

signal addToDiscard(ball)


func _on_Player_Panel_addToBoard(ball):
	arrayOfBalls.push_front(ball)
	var newBall = ball.instance()
	newBall.setBallTeam("Player")
	self.add_child(newBall)
	newBall.draggable(true)
	newBall.stopBouncingPhysics()


func _on_Player_Panel_startEnemyTurn():
	for i in get_children():
		i.draggable(false)



func _on_enemySpawnBallZone_startPlayerTurn():
	for i in get_children():
		i.draggable(true)



func _on_Area2D_sendBallToDiscard(ball):
	var index = 0
	for i in arrayOfBalls.size():
		if(ball.get_filename() == arrayOfBalls[i].get_path()):
			call_deferred("emit_signal", "addToDiscard", arrayOfBalls[i])
			index = i
			break
	arrayOfBalls.remove(index)
