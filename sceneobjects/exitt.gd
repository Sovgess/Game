extends Area2D

@export_file("*.tscn") var next_level

func _on_body_entered(body: Node2D) -> void:
	# Сохраняем количество собранного золота в глобальную переменную
	Global.gold = body.gold
	# Отложенный вызов нужен для безопасной смены сцены
	call_deferred("_go_to_win_menu")

func _go_to_win_menu():
	get_tree().change_scene_to_file("res://scene/sucseed_menu.tscn")
