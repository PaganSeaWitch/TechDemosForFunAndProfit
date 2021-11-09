extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
		print("ball fell")
		var payload = body.payloadDictionary;
		if(payload.size() != 0):
			resolvePayload(payload)
		body.queue_free()
