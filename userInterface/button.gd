extends Button #This script controls the button functions

func button_pressed():
	var button = self.get_name()
	if button == "start":
		get_tree().change_scene("res://Game_DO.tscn") #Insert the starting scene here
	elif button == "instructions":
		showInstructions()
	elif button == "credits":
		showCredits()
	elif button == "quit":
		get_tree().quit()
	elif button == "back":
		hideCredits()
	elif button == "backFromInstructions":
		hideInstructions()
	elif button == "controls":
		if $pc.visible == false:
			self.text = "Xbox Controls"
			$xbox.hide()
			$pc.show()
		elif $pc.visible == true:
			self.text = "PC Controls"
			$pc.hide()
			$xbox.show()
	
func showCredits():
	$"../../Credits".visible = true;
	
func hideCredits():
	$"../../Credits".visible = false;
	
func showInstructions():
	$"../../Instructions".visible = true;
	
func hideInstructions():
	$"../../../Instructions".visible = false;
