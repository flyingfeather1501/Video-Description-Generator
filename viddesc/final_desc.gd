
extends TextEdit

# member variables here, example:
# var a=2
# var b="textvar"

var SETSUMEI = ""
var CDT0 = ""
var CDT1 = ""
var CDT2 = ""
var CDT3 = ""
var CDT4 = ""
var sep = ""
var brkt_lft = ""
var brkt_rght = ""

onready var edit_desc = get_node("/root/Control/Container/vbox_desc/edit_desc")
onready var field_separator = get_node("/root/Control/Container/vbox_credits/hbox/field_separator")

onready var field_lft_brkt = get_node("/root/Control/Container/vbox_credits/hbox/field_(")
onready var field_rght_brkt = get_node("/root/Control/Container/vbox_credits/hbox/field_)")

onready var credit0_prepend = get_node("/root/Control/Container/vbox_credits/hbox_credit0/field_prepend")
onready var credit1_prepend = get_node("/root/Control/Container/vbox_credits/hbox_credit1/field_prepend")
onready var credit2_prepend = get_node("/root/Control/Container/vbox_credits/hbox_credit2/field_prepend")
onready var credit3_prepend = get_node("/root/Control/Container/vbox_credits/hbox_credit3/field_prepend")
onready var credit4_prepend = get_node("/root/Control/Container/vbox_credits/hbox_credit4/field_prepend")

onready var credit1_credit = get_node("/root/Control/Container/vbox_credits/hbox_credit1/field_credit")
onready var credit2_credit = get_node("/root/Control/Container/vbox_credits/hbox_credit2/field_credit")
onready var credit3_credit = get_node("/root/Control/Container/vbox_credits/hbox_credit3/field_credit")
onready var credit4_credit = get_node("/root/Control/Container/vbox_credits/hbox_credit4/field_credit")

onready var credit0_link = get_node("/root/Control/Container/vbox_credits/hbox_credit0/field_link")
onready var credit1_link = get_node("/root/Control/Container/vbox_credits/hbox_credit1/field_link")
onready var credit2_link = get_node("/root/Control/Container/vbox_credits/hbox_credit2/field_link")
onready var credit3_link = get_node("/root/Control/Container/vbox_credits/hbox_credit3/field_link")
onready var credit4_link = get_node("/root/Control/Container/vbox_credits/hbox_credit4/field_link")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func refresh():
	
	SETSUMEI = edit_desc.get_text()
	
	if field_lft_brkt.get_text() == "":
		brkt_lft = "["
	else:
		brkt_lft = field_lft_brkt.get_text()
	
	if field_rght_brkt.get_text() == "":
		brkt_rght = "]"
	else:
		brkt_rght = field_rght_brkt.get_text()
	
	# separator
	if field_separator.get_text() == "":
		sep = ": "
	else:
		sep = field_separator.get_text()
	
	# credits
	if credit0_prepend.get_text() == "":
		CDT0 = ""
	else:
		CDT0 = credit0_prepend.get_text()+sep+credit0_link.get_text()+"\n\n"
	
	if credit1_prepend.get_text() == "":
		CDT1 = ""
	elif credit1_link.get_text() == "":
		CDT1 = credit1_prepend.get_text()+sep+credit1_credit.get_text()+"\n"
	else:
		CDT1 = credit1_prepend.get_text()+sep+credit1_credit.get_text()+" "+brkt_lft+credit1_link.get_text()+brkt_rght+"\n"
	
	if credit2_prepend.get_text() == "":
		CDT2 = ""
	elif credit2_link.get_text() == "":
		CDT2 = credit2_prepend.get_text()+sep+credit2_credit.get_text()+"\n"
	else:
		CDT2 = credit2_prepend.get_text()+sep+credit2_credit.get_text()+" "+brkt_lft+credit2_link.get_text()+brkt_rght+"\n"
	
	if credit3_prepend.get_text() == "":
		CDT3 = ""
	elif credit3_link.get_text() == "":
		CDT3 = credit3_prepend.get_text()+sep+credit3_credit.get_text()+"\n"
	else:
		CDT3 = credit3_prepend.get_text()+sep+credit3_credit.get_text()+" "+brkt_lft+credit3_link.get_text()+brkt_rght+"\n"
	
	if credit4_prepend.get_text() == "":
		CDT4 = ""
	elif credit4_link.get_text() == "":
		CDT4 = credit4_prepend.get_text()+sep+credit4_credit.get_text()+"\n"
	else:
		CDT4 = credit4_prepend.get_text()+sep+credit4_credit.get_text()+" "+brkt_lft+credit4_link.get_text()+brkt_rght+"\n"
	
	self.set_text(\
	SETSUMEI+"\n"\
	+"\n"\
	+"\n"\
	+CDT0\
	+CDT1\
	+CDT2\
	+CDT3\
	\
	+CDT4)

func _fixed_process(delta):
	refresh()

func _on_toggle_autorefresh_toggled( toggle_state ):
	set_fixed_process(toggle_state)

func _on_button_refresh_pressed():
	refresh()
