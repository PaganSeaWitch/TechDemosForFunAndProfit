extends Node2D


var thread
var terminated = false
signal resetPegs
signal startPlayerTurn
var ballArray
var finished = false
var dropping = false
func _on_EnemyPanel_startSpawningBalls(ballArray):
	self.ballArray = ballArray
	dropping = true

func _process(delta):
	if(BallCountSingleton.ballCurrentCount == 0 && dropping == true):
		spawnFirstBall(ballArray)
	if(BallCountSingleton.ballCurrentCount == 0 && finished == true):
		finished = false
		emit_signal("resetPegs")
		emit_signal("startPlayerTurn")
		
func spawnFirstBall(ballArray):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var x = rng.randi_range(self.global_position.x, self.get_child(0).position.x)
	var ball = ballArray[0].instance()
	ball.setBallTeam("Enemy")
	ball.position = Vector2(x, 0)
	self.add_child(ball)
	ball.flipBallGravity()
	ballArray.remove(0)
	BallCountSingleton.increaseBallCount()
	
	if(ballArray.size() == 0):
		finished = true
		dropping = false


