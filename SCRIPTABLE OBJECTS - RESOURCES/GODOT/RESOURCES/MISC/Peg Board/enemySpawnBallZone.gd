extends Node2D
# TITLE : enemySpawnBallZone
# Functions : _on_EnemyPanel_startSpawningBalls, _process, spawnABall
# Purpose : To Spawn enemy balls within a specified zone
# Closely Connected Scripts : RandomPegZone, EnemyPanel, PlayerPanel, 
#		ballDropPosition, EndTurnButton


# connected To : RandomPegZone
# Purpose : Resets num of hits on pegs
signal resetPegs


# connected To : EnemyPanel, PlayerPanel, ballDropPosition, EndTurnButton
# Purpose : resets everything for next turn
signal startPlayerTurn

var ballArray : Array

var terminated := false
var finished := false
var dropping := false


# Recieved From : EnemyPanel
# Purpose : Spawns balls in the enemySpawnBallZone
func _on_EnemyPanel_startSpawningBalls(newBallArray : Array):
	self.ballArray = newBallArray
	dropping = true


# Purpose : ensures that only 1 ball is dropped at a time
# signals the end of the enemy turn
func _process(_delta : float):
	
	if(BallCountSingleton.ballCurrentCount == 0 && dropping == true):
		spawnABall()
		
	if(BallCountSingleton.ballCurrentCount == 0 && finished == true):
		finished = false
		emit_signal("resetPegs")
		emit_signal("startPlayerTurn")


# Purpose : spawns a ball at a random location within the spawn zone
func spawnABall():
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	var x := rng.randi_range(0, self.get_child(0).position.x)
	var ball = ballArray[0].instance()
	
	#sets up ball
	ball.setBallTeam("Enemy")
	ball.position = Vector2(x, 0)
	ball.changeHits()
	self.add_child(ball)
	ball.flipBallGravity()
	
	#remove ball from list
	ballArray.remove(0)
	BallCountSingleton.increaseBallCount()
	
	if(ballArray.size() == 0):
		finished = true
		dropping = false


