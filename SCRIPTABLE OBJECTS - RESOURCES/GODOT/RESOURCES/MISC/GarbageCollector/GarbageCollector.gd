extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var teamZone

signal sendBallToDiscard(ball)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func resolvePayload(payload):
	print(payload)

func _on_Area2D_body_entered(body):
	if(body is PachinkoBall):
		if(!body.is_in_group(teamZone)):
			var payload = body.payloadDictionary;
			if(payload.size() != 0):
				resolvePayload(payload)
			body.get_parent().call_deferred("queue_free")
			BallCountSingleton.decreaseBallCount()
			print(BallCountSingleton.ballCurrentCount)
			if(teamZone == "Enemy"):
				emit_signal("sendBallToDiscard", body.get_parent())
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			body.rightSpot = true



func _on_Area2D2_body_exited(body):
	if(body is PachinkoBall):
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			print("left the zone")
			body.rightSpot = false
