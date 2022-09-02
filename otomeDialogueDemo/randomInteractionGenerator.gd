extends Node2D


var boylove : int = -1
var line : String = ""
var dialogueStarted : bool = false
var dialogue : ClydeDialogue



func ready():
	ValueLookup.connect("emote", self, "emote")
	ValueLookup.connect("playSound", self, "playSound")
	ValueLookup.connect("exits", self, "characterExit")
	ValueLookup.connect("showScene", self, "showScene")
	ValueLookup.connect("thotsStyle", self, "characterizeLineAsThot")
	ValueLookup.connect("enters", self, "characterEnter")
	

func _input(event : InputEvent):
	if(event is InputEventMouseButton):
		if(event.button_index == BUTTON_LEFT && dialogueStarted == false):
			generateRandomEvent()
		elif(event.button_index == BUTTON_LEFT):
			parseContent(dialogue.get_content())

func generateRandomEvent():
	dialogue = ClydeDialogue.new();
	dialogue.load_dialogue("res://boy1.clyde")
	boylove = boylove + 1
	dialogue.set_variable("boyLove", boylove)
	dialogue.start()
	dialogueStarted = true;
	parseContent(dialogue.get_content())

func parseContent(content):
	if(content == null):
		dialogueStarted = false
		return
	match content.type:
		"line":
			line = content.get("text")

	if(content.get("tags") != null):
		for tag in content.get("tags"):
			ValueLookup.resolveTag(tag)
	#print(line)

func addNameToList(name : String):
	print("name added: "+ name)

func emote(emotion : String):
	print(emotion)
	
func playSound(sound : String):
	print(sound)
	
func characterExit(character : String):
	print(character)

func showScene(scene : String):
	print(scene)
	
func characterizeLineAsThot():
	print("character thots")
	
func enters(character : String):
	print(character)
