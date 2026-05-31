extends Area2D


@export_file("*.tscn") var next_level


func _on_body_entered(body: Node2D) -> void:
	Global.gold = body.gold
	call_deferred("_go_to_win_menu")

func _go_to_win_menu():
	get_tree().change_scene_to_file("res://scene/sucseed_menu.tscn")
