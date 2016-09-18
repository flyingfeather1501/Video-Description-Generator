extends LineEdit

# member variables here, example:
# var a=2
# var b="textvar"

var pv_tag = false
var utau_tag = false
var PV = ""
var UTAU = ""
var NAME = ""
var FEAT = ""
var EXTRA1 = ""
var EXTRA2 = ""
var brkt_lft = ""
var brkt_rght = ""

onready var field_lft_brkt = get_node("/root/Control/Container/vbox_title/hbox_title/field_(")
onready var field_rght_brkt = get_node("/root/Control/Container/vbox_title/hbox_title/field_)")
onready var field_feat = get_node("/root/Control/Container/vbox_title/hbox2/field_feat")
onready var field_feat_pre = get_node("/root/Control/Container/vbox_title/hbox2/field_pre")
onready var field_extra1 = get_node("/root/Control/Container/vbox_title/field_extra_1")
onready var field_extra2 = get_node("/root/Control/Container/vbox_title/field_extra_2")
onready var field_name = get_node("/root/Control/Container/vbox_title/field_name")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func refresh():
	var extra1_raw = field_extra1.get_text()
	var extra2_raw = field_extra2.get_text()
	var feat_raw = field_feat.get_text()
	var feat_pre = field_feat_pre.get_text()
	var brkt_lft_raw = field_lft_brkt.get_text()
	var brkt_rght_raw = field_rght_brkt.get_text()
	
	if brkt_lft_raw == "":
		brkt_lft = "【"
	else:
		brkt_lft = brkt_lft_raw
	
	if brkt_rght_raw == "":
		brkt_rght = "】"
	else:
		brkt_rght = brkt_rght_raw
	
	if pv_tag == true:
		PV = brkt_lft+"PV"+brkt_rght
	else:
		PV = ""
	
	if utau_tag == true:
		UTAU = brkt_lft+"UTAU"+brkt_rght
	else:
		UTAU = ""
	
	if extra1_raw == "":
		EXTRA1 = ""
	else:
		EXTRA1 = brkt_lft+extra1_raw+brkt_rght
	
	if extra2_raw == "":
		EXTRA2 = ""
	else:
		EXTRA2 = brkt_lft+extra2_raw+brkt_rght
	
	if feat_raw == "":
		FEAT = ""
	else:
		FEAT = " "+feat_pre+feat_raw
	
	NAME = field_name.get_text()
	
	self.set_text(PV+NAME+FEAT+UTAU+EXTRA1+EXTRA2)

func _fixed_process(delta):
	refresh()

func _on_checkbox_PV_toggled( check_state ):
	pv_tag = check_state
	return pv_tag

func _on_checkbox_UTAU_toggled( check_state ):
	utau_tag = check_state
	return utau_tag

func _on_button_refresh_pressed():
	refresh()

func _on_toggle_autorefresh_toggled( toggle_state ):
	set_fixed_process(toggle_state)
