extends Node2D

# TITLE : transferResources
# Functions : _ready, flipBallGravity, setBallTeam, stopBouncingPhysics,
#		draggable, changeHits
# Purpose : Transfers ball resource to ball
# Closely Connected Scripts : BALL


# Connected To : BALL
# Purpose : Transfers ballResource to Ball
signal transferResources(ballResource)


# Connected To : BALL
# Purpose : Changes the ball mode to static
signal changeToStatic


# Connected To : BALL
# Purpose : flips gravity of ball
signal flipGravity


# Connected To : BALL
# Purpose : sets the team of the ball
signal setTeam(team)


# Connected To : BALL
# Purpose : stops ball boucing
signal stopBouncing


# Connected To : BALL
# Purpose : makes ball draggable
signal draggable(canBeDragged)

export(bool) var ballIsStatic : bool
export(Resource) var ballResource : Resource

# Purpose : sends ballResources to ball
func _ready() -> void:
	if(ballIsStatic):
		emit_signal("changeToStatic")
	emit_signal("transferResources", ballResource)


# Purpose : flip gravity of ball
func flipBallGravity() -> void:
	emit_signal("flipGravity")

# Purpose : sets team name of ball
func setBallTeam(team : String) -> void:
	if(team == 'Enemy'):
		emit_signal('setTeam', team)
	if(team == 'Player'):
		emit_signal('setTeam', team)


# Purpose : stop ball bouncing
func stopBouncingPhysics() -> void:
	emit_signal("stopBouncing")


# Purpose : makes ball draggable or not
func draggable(canBeDragged : bool) -> void:
	emit_signal("draggable", canBeDragged)


# Purpose : changes the hits to be for enemy or player
func changeHits() -> void:
	if(ballResource is ActionBallResource):
		ballResource.setHits()
		for i in ballResource.currentHits.size():
			if(ballResource.currentHits[i] is PayloadModifierHit):
				if(ballResource.currentHits[i].team == "Enemy" && ballResource.currentHits[i].team == ballResource.hits[i].team):
					ballResource.currentHits[i].team = "Player"
				elif(ballResource.currentHits[i].team == "Player" && ballResource.currentHits[i].team == ballResource.hits[i].team):
					ballResource.currentHits[i].team = "Enemy"

