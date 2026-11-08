extends CanvasLayer
class_name Quest

var id: int
var title: String
var description: String
var state: int
var priority: int

func _ready() -> void:
	hide()

func _init(_id, _title, _description, _priority = 0):
	id = _id
	title = _title
	description = _description
	state = QuestManager.QuestState.LOCKED
	priority = _priority

func _display_current_quest():

	show()
	$Display/Title.text = title
	$Display/Quest.text = description
	
	await get_tree().create_timer(3).timeout
	hide()
