extends CanvasLayer

@onready var anim:AnimationPlayer = $AnimationPlayer

var is_paused:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("Pause"):
		if not is_paused:
			_show_pause_menu()
		else:
			pass

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	$AudioStreamPlayer.stop()
	get_tree().paused = false
	is_paused = false
	hide()

func _show_pause_menu() -> void:
	$AudioStreamPlayer.play()
	get_tree().paused = true
	anim.play("Show_Menu")
	$Bottom/Menu/Resume.grab_focus(true)
	is_paused = true
	show()

func _on_title_screen_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Title Screen.tscn")


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
