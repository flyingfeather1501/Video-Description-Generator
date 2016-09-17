
extends LineEdit

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_editable(true)

func _on_checkbox_feat_toggled( check_state ):
	print("checkbox_feat toggled")
	if check_state == true:
		self.set_editable(true)
	elif check_state == false:
		self.set_text("")
		self.set_editable(false)
	else:
		print("Something went wrong. checkbox_feat")
