extends Control

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level3.tscn")

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level4.tscn")
