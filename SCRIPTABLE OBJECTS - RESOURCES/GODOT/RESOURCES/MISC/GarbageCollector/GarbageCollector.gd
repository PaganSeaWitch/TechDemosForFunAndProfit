extends Area2D
# TITLE : GarbageCollector
# Functions : _on_Area2D_body_entered, _on_Area2D2_body_exited, resolvePayload,
# 		disposeBall
# Purpose : To Properly Dispose of Balls and To Administer Their Effects
# Closely Connected Scripts : BallDropPosition


# connected To : BallDropPosition
# Purpose : Sends a player ball thats been disposed to the discard
signal sendBallToDiscard(ball)


# connected To : EnemyPanel
# Purpose : Sends a payload to the enemy to affect their values
signal sendPayloadToEnemy(key, value)


# connected To : PlayerPanel
# Purpose : Sends a playload to the enemy to affect their values
signal sendPayloadToPlayer(key, value)


export(String) var teamZone : String


# Recieved From : GarbageCollector
# Purpose : Checks whether the body is a ball, and if it is, checks whether to dispose or drop it
# based on whether its on the opposing team
func _on_Area2D_body_entered(body : RigidBody2D) -> void:
	if(body is PachinkoBall):
		if(!body.is_in_group(teamZone)):
			disposeBall(body)
		#ensures that the ball can only be dropped if it's within this space
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			body.rightSpot = true


# Recieved From : GarbageCollector
# Purpose : Checks whether the body is a player ball and ensures the ball can't be placed
func _on_Area2D2_body_exited(body : RigidBody2D) -> void:
	if(body is PachinkoBall):
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			print("left the zone")
			body.rightSpot = false


# Purpose : resolves a ball's payload by sending it to the enemy or player
func resolvePayload(payload : Dictionary) -> void:
	print(payload)
	if(payload.has("Enemy")):
		for i in payload["Enemy"]:
			emit_signal("sendPayloadToEnemy",i, payload["Enemy"][i])
	if(payload.has("Player")):
		for i in payload["Player"]:
			emit_signal("sendPayloadToPlayer", i, payload["Player"][i])


# Purpose : Disposes of the ball by removing it while resolving the ball's payload
func disposeBall(body : RigidBody2D) -> void:
	var payload = body.payloadDictionary;
	if(payload.size() != 0):
		resolvePayload(payload)
				
		#remove ball and decrement the singleton
		body.get_parent().call_deferred("queue_free")
		BallCountSingleton.decreaseBallCount()
		print(BallCountSingleton.ballCurrentCount)
	
	#If this zone is for the enemy, the ball belongs to the player
	#thus send ball to discard
	if(teamZone == "Enemy"):
		emit_signal("sendBallToDiscard", body.get_parent())
