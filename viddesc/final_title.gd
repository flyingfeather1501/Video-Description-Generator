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
var EXTRA1 = ""
var EXTRA2 = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	var extra1_raw = get_node("/root/Control/Container/vbox_title/field_extra_1").get_text()
	var extra2_raw = get_node("/root/Control/Container/vbox_title/field_extra_2").get_text()
	var feat_raw = get_node("/root/Control/Container/vbox_title/field_feat").get_text()
	if pv_tag == true:
		PV = "【PV】"
	else:
		PV = ""
	
	if utau_tag == true:
		UTAU = "【UTAU】"
	else:
		UTAU = ""
	
	if extra1_raw == "":
		EXTRA1 = ""
	else:
		EXTRA1 = "【"+extra1_raw+"】"
	
	if extra2_raw == "":
		EXTRA2 = ""
	else:
		EXTRA2 = "【"+extra2_raw+"】"
	
	if feat_raw == "":
		FEAT = ""
	else:
		FEAT = " ft."+feat_raw
	
	NAME = get_node("/root/Control/Container/vbox_title/field_name").get_text()
	
	self.set_text(PV+NAME+FEAT+UTAU+EXTRA1+EXTRA2)

func _on_checkbox_PV_toggled( check_state ):
	pv_tag = check_state
	return pv_tag

func _on_checkbox_UTAU_toggled( check_state ):
	utau_tag = check_state
	return utau_tag
