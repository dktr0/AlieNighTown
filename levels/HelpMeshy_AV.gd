extends Area

func _on_HelpMeshy_AV_body_entered(body): # 
	if body.name == "player":
		get_tree().get_current_scene().textShout("Thanks so much, back to dancing!")


func _on_HelpMeshy_AV_body_exited(body):
	if body.name == "player":
		queue_free()
