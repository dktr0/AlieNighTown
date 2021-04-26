extends KinematicBody

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 
var speed = 5
var acceleration = 20
var gravity = 20
var jump = 7
var turnspeed = 1
var counter = 0

#Gets all the HUD nodes
onready var HUD2 = get_node("danceHUD/HUD2-locked")
onready var HUD3 = get_node("danceHUD/HUD3-locked")
onready var HUD4 = get_node("danceHUD/HUD4-locked")
onready var HUD5 = get_node("danceHUD/HUD5-locked")
onready var HUD6 = get_node("danceHUD/HUD6-locked")
onready var HUD7 = get_node("danceHUD/HUD7-locked")
onready var animCtrl = get_node("mainchar_main/AnimationController")
onready var walk = get_node("walk_sound/walk_sound")
onready var jump_sound = get_node("jump_sound/jump")
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	updateHUD()	
	animCtrl.play("Idle",0.1)

func updateHUD():
	print("HUD update") #A place for the HUD to be updated, when switching levels unlocked moves must be saved
	
func _physics_process(delta):
	direction = Vector3()
	
	if not is_on_floor():
		fall.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor(): #set the spacebar as the jump button in project settings
		fall.y = jump
		jump_sound.play()
	
	var forward = Input.get_action_strength("forward")
	if forward:
		if not walk.is_playing():
			walk.play()
		direction += transform.basis.z * forward
		animCtrl.play("Walking",0.1)

	var backward = Input.get_action_strength("backward")
	if backward:
		if not walk.is_playing():
			walk.play()
		direction -= transform.basis.z * backward
		animCtrl.play("Walking",0.1)
		
	var turnleft = Input.get_action_strength("turnleft")
	if turnleft:
		if not walk.is_playing():
			walk.play()
		rotate_y(deg2rad(turnspeed*turnleft))
		animCtrl.play("Walking",0.1)
		
	var turnright = Input.get_action_strength("turnright")
	if turnright:
		if not walk.is_playing():
			walk.play()
		rotate_y(deg2rad(turnspeed*(-1)*turnright))
		animCtrl.play("Walking",0.1)
		
	if Input.is_action_just_released("ui_up"):
		walk.stop()
		animCtrl.play("Idle",0.1)
		
	if Input.is_action_just_released("ui_down"):
		walk.stop()
		animCtrl.play("Idle",0.1)
	
	if Input.is_action_just_released("ui_left"):
		walk.stop()
		animCtrl.play("Idle",0.1)
	
	if Input.is_action_just_released("ui_right"):
		walk.stop()
		animCtrl.play("Idle",0.1)
		
	
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 
	move_and_slide(fall, Vector3.UP)
	
	if Input.is_action_just_pressed("move_1"):
		$"dance_sounds".playSounds()
		animCtrl.play("Orange",0.1)
		print("do dance move 1") #Insert move 1 here
		counter = counter + 1
		if counter == 5:
			unlockMove2()
			
	if HUD2.visible == false:
		if Input.is_action_just_pressed("move_2"):
			$"dance_sounds".playSounds()
			animCtrl.play("Floss",0.1)
			print("do dance move 2") #Insert move 2 here
		
	if HUD5.visible == false:
		if Input.is_action_just_pressed("move_5"):
			$"dance_sounds".playSounds()
			animCtrl.play("Disco",0.1)
			print("do dance move 5")
			
	if HUD6.visible == false:
		if Input.is_action_just_pressed("move_6"):
			$"dance_sounds".playSounds()
			animCtrl.play("Shimmy",0.1)
			print("do dance move 6")
			
	if HUD3.visible == false:
		if Input.is_action_just_pressed("move_3"):
			$"dance_sounds".playSounds()
			animCtrl.play("Wave",0.1)
			print("do dance move 3")
			
	if HUD4.visible == false:
		if Input.is_action_just_pressed("move_4"):
			$"dance_sounds".playSounds()
			animCtrl.play("Spin",0.1)
			print("do dance move 6")
			
	if HUD7.visible == false:
		if Input.is_action_just_pressed("move_7"):
			$"dance_sounds".playSounds()
			animCtrl.play("Backflip",0.1)
			print("do dance move 7")
			
			
func unlockMove2():
	if HUD2.visible == true:
		HUD2.hide()
		get_tree().get_current_scene().celebrateNewMove(2)
		maybeUnlockMove7()
	
func unlockMove3():
	if HUD3.visible == true:
		HUD3.hide()
		get_tree().get_current_scene().celebrateNewMove(3)
		maybeUnlockMove7()
	
func unlockMove4():
	if HUD4.visible == true:
		HUD4.hide()
		get_tree().get_current_scene().celebrateNewMove(4)
		maybeUnlockMove7()
	
func unlockMove5():
	if HUD5.visible == true:
		HUD5.hide()
		get_tree().get_current_scene().celebrateNewMove(5)
		maybeUnlockMove7()
	
func unlockMove6():
	if HUD6.visible == true:
		HUD6.hide()
		get_tree().get_current_scene().celebrateNewMove(6)
		maybeUnlockMove7()
	
func maybeUnlockMove7():
	if HUD2.visible == false\
	and HUD3.visible == false\
	and HUD4.visible == false\
	and HUD5.visible == false\
	and HUD6.visible == false:
		HUD7.hide()
		# TODO: really this should be on a timer so happens a moment later...
		get_tree().get_current_scene().celebrateNewMove(7)
		

