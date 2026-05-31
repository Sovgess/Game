extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		# Плавно поднимаем монету вверх
		tween.tween_property(self, "position", position - Vector2(0, 40), 0.3) 
		# Постепенно делаем её прозрачной
		tween1.tween_property(self, "modulate:a", 0, 0.3) 
		# После анимации удаляем объект
		tween.tween_callback(queue_free)
		body.gold += 1 
		
