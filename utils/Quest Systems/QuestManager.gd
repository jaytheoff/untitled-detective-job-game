@tool
extends Node

enum QuestState {
	LOCKED,
	ACTIVE,
	COMPLETED
}

var quests = {}
@onready var QuestDisplay := preload("res://Utils/Quest Systems/Objective Display.tscn")
var QuestNode:Node = null

func add_quest(id, title , description, priority = 0):
	QuestNode = QuestDisplay.instantiate()
	get_tree().get_root().call_deferred("add_child", QuestNode)

	var quest = Quest.new(id, title, description, priority)
	quests[id] = quest
	

func _show_quest():
	if QuestNode.has_method("_display_current_quest"):
		await QuestNode.call("_display_current_quest")


func start_quest(id):
	quests[id].state = QuestState.ACTIVE


func complete_quest(id):
	quests[id].state = QuestState.COMPLETED

#Reminder on how to check if a quest is active or not.
	# if QuestManager.quests["fix_fridge"].state == QuestManager.QuestState.COMPLETED:
   # print("Quest done!")
