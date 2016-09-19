
extends TextEdit

var SETSUMEI = ""
var cdt_0 = ""
var cdt_origpvused = ""
var cdt_1 = ""
var cdt_2 = ""
var cdt_3 = ""
var cdt_4 = ""
var sep = ""
var brkt_lft = ""
var brkt_rght = ""

onready var field_origpvused = get_node("/root/Control/Container/vbox_credits/hbox_credit0/field_origpvused")

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
		cdt_0 = ""
	elif field_origpvused.get_text() == "":
		cdt_0 = credit0_prepend.get_text()+sep+credit0_link.get_text()+"\n\n"
	else:
		cdt_0 = credit0_prepend.get_text()+sep+credit0_link.get_text()+"\n"+field_origpvused.get_text()+"\n\n"
	
	if credit1_prepend.get_text() == "":
		cdt_1 = ""
	elif credit1_link.get_text() == "":
		cdt_1 = credit1_prepend.get_text()+sep+credit1_credit.get_text()+"\n"
	else:
		cdt_1 = credit1_prepend.get_text()+sep+credit1_credit.get_text()+" "+brkt_lft+credit1_link.get_text()+brkt_rght+"\n"
	
	if credit2_prepend.get_text() == "":
		cdt_2 = ""
	elif credit2_link.get_text() == "":
		cdt_2 = credit2_prepend.get_text()+sep+credit2_credit.get_text()+"\n"
	else:
		cdt_2 = credit2_prepend.get_text()+sep+credit2_credit.get_text()+" "+brkt_lft+credit2_link.get_text()+brkt_rght+"\n"
	
	if credit3_prepend.get_text() == "":
		cdt_3 = ""
	elif credit3_link.get_text() == "":
		cdt_3 = credit3_prepend.get_text()+sep+credit3_credit.get_text()+"\n"
	else:
		cdt_3 = credit3_prepend.get_text()+sep+credit3_credit.get_text()+" "+brkt_lft+credit3_link.get_text()+brkt_rght+"\n"
	
	if credit4_prepend.get_text() == "":
		cdt_4 = ""
	elif credit4_link.get_text() == "":
		cdt_4 = credit4_prepend.get_text()+sep+credit4_credit.get_text()+"\n"
	else:
		cdt_4 = credit4_prepend.get_text()+sep+credit4_credit.get_text()+" "+brkt_lft+credit4_link.get_text()+brkt_rght+"\n"
	
	self.set_text(\
	SETSUMEI+"\n"\
	+"\n"\
	+"\n"\
	+cdt_0\
	+cdt_1\
	+cdt_2\
	+cdt_3\
	\
	+cdt_4)

func _fixed_process(delta):
	refresh()

func _on_toggle_autorefresh_toggled( toggle_state ):
	set_fixed_process(toggle_state)

func _on_button_refresh_pressed():
	refresh()
