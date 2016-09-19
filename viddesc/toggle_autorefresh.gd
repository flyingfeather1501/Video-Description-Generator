
extends CheckButton

# member variables here, example:
# var a=2
# var b="textvar"

onready var button_refresh = get_node("../button_refresh")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _toggled(toggle_state):
	if toggle_state == true: #auto refresh on, hide manual refresh
		button_refresh.hide()
	elif toggle_state == false:
		button_refresh.show()