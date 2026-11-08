extends Node3D


const MOUSE_SENSITIVITY := 0.002
const MAX_PITCH := deg_to_rad(89.0)

@onready var player: Node3D = get_parent() as Node3D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		player.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		rotation.x = clampf(
			rotation.x - event.relative.y * MOUSE_SENSITIVITY,
			-MAX_PITCH,
			MAX_PITCH
		)
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
