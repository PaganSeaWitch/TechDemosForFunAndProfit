extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var epilepsy = load("res://ColorRect.tscn")
var scroll = load("res://ScrollContainer.tscn")
var drag = load("res://drag.tscn")
var boxes = load("res://boxes.tscn")
static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ScrollButton_pressed():
	delete_children(self)
	var newScroll = scroll.instance();
	self.add_child(newScroll)

func _on_epilepsyButton_pressed():
	delete_children(self)
	var newEpilepsy = epilepsy.instance();
	self.add_child(newEpilepsy)

func _on_boxes_within_boxes_pressed():
	delete_children(self)
	var newBoxes = boxes.instance();
	self.add_child(newBoxes)


func _on_DragButton_pressed():
	delete_children(self)
	var newDrag = drag.instance();
	self.add_child(newDrag)
