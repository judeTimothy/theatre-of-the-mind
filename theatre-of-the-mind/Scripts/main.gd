extends Control


@onready var container = $ScrollContainer/VBoxContainer
var status = 0
var message =["Who are you?"]
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
	pass


func _on_option_1_pressed() -> void:
	add_label("story","You",message[status],"self")
	status+=1
