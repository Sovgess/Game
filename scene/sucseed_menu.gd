extends Node2D

func _ready():
	$GoldLabel.text = str(Global.gold)
	
func _on_next_level_pressed() -> void:
	print("BUTTON PRESSED")
	var current_path = Global.last_level_path
	# Получаем номер текущего уровня из имени файла
	var level_number = current_path.get_file().trim_prefix("level").trim_suffix(".tscn").to_int()
	# Если уровень последний — возвращаемся в меню
	if level_number == Global.max_levels:
		get_tree().change_scene_to_file("res://scene/menu.tscn")
	else:
		# Формируем путь к следующему уровню автоматически
		var next_level = level_number + 1
		var next_path = "res://scene/levels/level" + str(next_level) + ".tscn"
		get_tree().change_scene_to_file(next_path)

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
