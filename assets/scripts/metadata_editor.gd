extends Node2D

@onready var line_edit_id: LineEdit = $Control/VBoxContainer/HBoxContainer/LineEditID
@onready var line_edit_name: LineEdit = $Control/VBoxContainer/HBoxContainer2/LineEditName
@onready var line_edit_author: LineEdit = $Control/VBoxContainer/HBoxContainer3/LineEditAuthor
@onready var line_edit_desc: LineEdit = $Control/VBoxContainer/HBoxContainer4/LineEditDesc
@onready var line_edit_prefix: LineEdit = $Control/VBoxContainer/HBoxContainer5/LineEditPrefix
@onready var line_edit_prio: LineEdit = $Control/VBoxContainer/HBoxContainer6/LineEditPrio
@onready var line_edit_version: LineEdit = $Control/VBoxContainer/HBoxContainer7/LineEditVersion



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
