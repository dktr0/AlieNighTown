extends Spatial

 


	
	

	


func _on_Entry_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadNextLevel()
	


func _on_Exit_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadPrevLevel()



func _on_Move6_body_entered(body):
	if body.name == "player":
		$"../../player".unlockMove4() # was 6
	


func _on_Move5_body_entered(body):
	if body.name == "player":
		$"../../player".unlockMove3() # was 5
	
