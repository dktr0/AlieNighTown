extends Spatial

 
func nextLevelTeleportEntered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadNextLevel()
	
func prevLevelTeleportEntered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadPrevLevel()

func _on_MarketDoor_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadNextLevel()

func _on_BeachDoor_body_entered(body):
	if body.name == "player":
		get_tree().get_current_scene().loadPrevLevel()
