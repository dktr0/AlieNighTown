extends Spatial

func _on_LevelDoorway1_body_entered(body): 
	if body.name == "player": # When the first area node is entered by the player...
		get_tree().get_current_scene().loadNextLevel() # Load the next level in order

func _on_LevelDoorway2_body_entered(body):
	if body.name == "player": # When the second area node is entered by the player...
		get_tree().get_current_scene().loadPrevLevel() # Load the previous level in the order

