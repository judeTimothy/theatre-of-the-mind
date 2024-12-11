extends Control


@onready var container = $ScrollContainer/VBoxContainer
var status = 0
var special = 0
var message1 =["Who are you?","Placeholder"]
var message2 = ["Where am I?","Placeholder"]
var message3 = ["Attack.","Placeholder"]
var message4 = ["Stay Silent.","Placeholder"]
var npc_chat = ["Oh, you're finally awake. You were knocked out for quite a while.", "You don't know me? That's bad. You were hit pretty bad after all. It's me, James."]

func _ready() -> void:
	#for i in range(4):
	#	add_label("","Unnamed Human", message[status])
	pass

func add_label(context,speaker,message,alignment):
	var label = RichTextLabel.new()
	label.bbcode_enabled = true
	label.custom_minimum_size.y = 23
	var format_string = "[color=green][b]%s:[/b][/color] %s"
	match alignment:
		"self":
			format_string = "[color=yellow][b]%s:[/b][/color] %s"
		"ally":
			format_string = "[color=green][b]%s:[/b][/color] %s"
		"enemy":
			format_string = "[color=red][b]%s:[/b][/color] %s"
		"unknown":
			format_string = "[color=skyblue][b]%s:[/b][/color] %s"
	label.text = format_string % [speaker,message]
	print(label.text)
	container.add_child(label)
	#container.move_child(label,0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$VBoxContainer/Option1.text = message1[status]
	$VBoxContainer/Option2.text = message2[status]
	$VBoxContainer/Option3.text = message3[status]
	$VBoxContainer/Option4.text = message4[status]


func _on_option_1_pressed() -> void:
	add_label("story","You",message1[status],"self")
	if special == 2:
		status+=1
		special = 0
	else:
		special += 1
	$Timer.start()


func _on_timer_timeout() -> void:
	add_label("story","James",npc_chat[status],"ally")
