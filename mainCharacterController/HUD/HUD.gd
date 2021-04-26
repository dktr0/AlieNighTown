extends Control

signal unlock

func _on_enemyHitBox_body_entered(body):
	if body.name == "player":
		emit_signal("playerHit", self)
	
