extends Spatial

func playSounds(soundName = null):
		if soundName == null:
				playRandom()
		else:
			get_node(soundName).play()
				

func playRandom():
		var c = randi() % get_child_count()
		get_child(c).play()
