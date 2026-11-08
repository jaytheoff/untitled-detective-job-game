extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Start")

func _show_warning(text:String):
	var dialogue = $MarginContainer/VBoxContainer/Dialogue
	dialogue.visible_characters = 0
	dialogue.text = text
	
	var tween = create_tween()
	tween.tween_property(dialogue, "visible_characters", text.length(), 2.0)
	await tween.finished
	dialogue.visible_characters = text.length()

func _show_threat_level(text:String):
		var tween = create_tween()
		$MarginContainer/VBoxContainer/Threat_Text.visible_characters = 0
		$MarginContainer/VBoxContainer/Threat_Text.text = text
	
		tween.tween_property($MarginContainer/VBoxContainer/Threat_Text, "visible_characters", text.length(), 0.4)
		await tween.finished
	
		tween.stop()
		$MarginContainer/VBoxContainer/Threat_Text.visible_characters = text.length()

func _hide_message():
	hide()
