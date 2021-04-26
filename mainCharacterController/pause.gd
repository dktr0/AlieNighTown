extends Control

func _ready():
	self.visible = false

func _physics_process(delta):
	if Input.is_action_pressed("pause"): #insert pause button here
		if self.visible == false:
			get_tree().paused = true
			self.visible = true

func _on_mainMenu_pressed():
	get_tree().paused = false 
	get_tree().change_scene("res://mainMenu.tscn")

func _on_resume_pressed():
	get_tree().paused = false 
	self.visible = false
