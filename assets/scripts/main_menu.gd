extends Node2D




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/metadata editor.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/hub_menu.tscn")
