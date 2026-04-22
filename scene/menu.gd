extends Node2D

func _on_quit_pressed():
	get_tree().quit()
	
	
func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/level_select_menu.tscn")
