extends Spatial

func teleportToNextLevelEntered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadNextLevel()



func _on_Door1_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadNextLevel()

	   
func _on_Door2_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadPrevLevel()


func _on_Area_body_entered(body):
	if body.name == "player":
		$"../../player".unlockMove5() # was 3


func _on_Dance4_body_entered(body):
	if body.name == "player":
		$"../../player".unlockMove6() # was 4
