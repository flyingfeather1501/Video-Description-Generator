extends LineEdit

# member variables here, example:
# var a=2
# var b="textvar"

var pv_tag = false
var utau_tag = false
var PV = ""
var UTAU = ""
var NAME = "name"
var FEAT = "feat"
var EXTRA = "extra"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	var extra_raw = get_node("/root/Control/Container/vbox_title/field_extra").get_text()
	if pv_tag == true:
		PV = "【PV】"
	else:
		PV = ""
	
	if utau_tag == true:
		UTAU = "【UTAU】"
	else:
		UTAU = ""
	
	if extra_raw == "":
		EXTRA = ""
	else:
		EXTRA = "【"+extra_raw+"】"
	
	NAME = get_node("/root/Control/Container/vbox_title/field_name").get_text()
	FEAT = get_node("/root/Control/Container/vbox_title/hbox_feat/Control/field_feat").get_text()
	
	self.set_text(PV+NAME+" ft."+FEAT+UTAU+EXTRA)

func _on_checkbox_PV_toggled( check_state ):
	pv_tag = check_state
	return pv_tag

func _on_checkbox_UTAU_toggled( check_state ):
	utau_tag = check_state
	return utau_tag
