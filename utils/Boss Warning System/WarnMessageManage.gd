@tool
extends Node

@export var MessageTextName: String = "MessageTextBox"

@onready var MessageScene := preload("res://Utils/Boss Warning System/Warn_textbox_.tscn")
var MessageTextBox: Node = null

func _ready() -> void:
	# Instantiate the TextBox scene and add it to the root so it's available globall
	MessageTextBox = MessageScene.instantiate()
	get_tree().get_root().call_deferred("add_child", MessageTextBox)
	MessageTextBox.name = MessageTextName
	MessageTextBox.hide()

func show_text(text: String)-> void:
	MessageTextBox.show()
	
	if not MessageTextBox:
		push_error("UIManager: MessageTextbox not ready")
		return
	if MessageTextBox.has_method("_show_warning"):
		await MessageTextBox.call("_show_warning", text)

func _show_threat_text(text:String):
	if MessageTextBox.has_method("_show_threat_level"):
		await MessageTextBox.call("_show_threat_level", text)
	else:
		push_error("UIManager: textbox missing show_text/_add_text methods")

func hide_text() -> void:
	if MessageTextBox and MessageTextBox.has_method("_hide_message"):
		MessageTextBox.call("_hide_message")
	elif MessageTextBox:
		MessageTextBox.hide()
