extends CanvasLayer

@export var _dialogue: RichTextLabel
@export var _name: Label


func _ready() -> void:
	if not _dialogue or not _name:
		push_error("Textbox scene is missing one or more expected nodes. Dialogue: %s, Name: %s" % [_dialogue, _name])
		return


#Dialogue Functions
func _show_textbox():
	_dialogue.text = ""
	_name.text = ""
	show()

func _hide_textbox():
	_dialogue.text = ""
	_name.text = ""
	hide()

func _add_text(text: String, speaker: String) -> void:
	var tween = create_tween()
	_show_textbox()
	_dialogue.text = text
	_dialogue.visible_characters = 0
	_name.text = speaker
	
	tween.tween_property(_dialogue, "visible_characters", text.length(), 0.8)
	await tween.finished
	while not Input.is_action_pressed("Action_1"):
		await get_tree().process_frame
	tween.stop()
	_dialogue.visible_characters = text.length()
	
# Public wrapper so other scripts (or a UI manager) can call this
func show_text(text: String, speaker: String) -> void:
	await _add_text(text, speaker)

func hide_text() -> void:
	_hide_textbox()
