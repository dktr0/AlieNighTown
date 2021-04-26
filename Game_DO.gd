extends Spatial

const cargoShip = preload("res://levels/CargoShip FA.tscn")
const beach = preload("res://levels/Beach Level_NA.tscn")
const wareHouse = preload("res://levels/HubRoom_AV.tscn")
const nightMarket = preload("res://levels/NightMarket_DC.tscn")

onready var LevelTimer = get_node("LevelTimer")
var levelChange = true
var currentLevel = 1
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	loadCurrentLevel()
	updateHint()


func _physics_process(delta):
	if Input.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if levelChange == true:
		if Input.is_action_pressed("ui_focus_next"):
			levelChange = false
			loadNextLevel()
			LevelTimer.set_wait_time(0.5)
			LevelTimer.start()
				
		elif Input.is_action_pressed("ui_focus_prev"):
			levelChange = false
			loadPrevLevel()
			LevelTimer.set_wait_time(0.5)
			LevelTimer.start()
		
func loadCurrentLevel():
	if currentLevel == 1:
		loadCargoShip()
	elif currentLevel == 2:
		loadBeach()
	elif currentLevel == 3:
		loadWareHouse()
	else:
		loadNightMarket()

func loadNextLevel():
	currentLevel = currentLevel + 1
	if currentLevel > 4:
		currentLevel = 1
	loadCurrentLevel()
	
func loadPrevLevel():
	currentLevel = currentLevel - 1
	if currentLevel < 1:
		currentLevel = 4
	loadCurrentLevel()
	
func loadCargoShip():
	loadLevel(cargoShip)

func loadWareHouse():
	loadLevel(wareHouse)

func loadNightMarket():
	loadLevel(nightMarket)
	
func loadBeach():
	loadLevel(beach)


func loadLevel(level):
		# delete previous level if there is one
	if $Level.get_child_count() > 0:
		var prevLevel = $Level.get_child(0)
		prevLevel.queue_free()
	# instantiate new level
	var x = level.instance()
	# if the level has a player object already, position the global player at the same location, then delete the "embedded" player
	var embeddedPlayer = x.get_node("player")
	if embeddedPlayer != null:
		$player.rotation = embeddedPlayer.rotation
		$player.translation = embeddedPlayer.translation
		embeddedPlayer.queue_free() 
	else:
		$player.translation = Vector3(0,3,0)
	# finally, add new level to this Game
	$Level.add_child(x)

func _on_LevelTimer_timeout(): #Timer to wait 0.5 seconds until next level change
	levelChange = true


func npcRandomMove(npc):
	var impulseStrength = 1.5
	if rng.randf() <= 0.25: # 25% chance of a random move
		var m = rng.randi_range(0,3)
		if m == 0:
			var i = npc.get_global_transform().basis.z.normalized() * impulseStrength
			npc.apply_impulse(Vector3(0,0,0),i)
		elif m == 1:
			var i = get_global_transform().basis.z.normalized() * (-1) * impulseStrength
			npc.apply_impulse(Vector3(0,0,0),i)
		elif m == 2:
			var i = npc.get_global_transform().basis.x.normalized() * impulseStrength
			npc.apply_impulse(Vector3(0,0,0),i)
		elif m == 3:
			var i = npc.get_global_transform().basis.x.normalized() * impulseStrength
			npc.apply_impulse(Vector3(0,0,0),i)

func _on_NPCMoveTimer_timeout():
	var npcs = get_tree().get_nodes_in_group("npc")
	for npc in npcs:
		npcRandomMove(npc)

func textShout(msg):
	$TextShout.text = msg
	$TextShoutTimer.start()
	print(msg)
	
func clearTextShout():
	$TextShout.text = ""
	
func celebrateNewMove(moveNumber):
	if moveNumber == 2:
		textShout("Unlocked the Floss!")
		$player/interact_sound/interact.play()
	elif moveNumber == 5:
		textShout("Unlocked the Disco!")
		$player/interact_sound/interact.play()
	elif moveNumber == 6:
		textShout("Unlocked the Shimmy!")
		$player/interact_sound/interact.play()
	elif moveNumber == 3:
		textShout("Unlocked the Wave!")
		$player/interact_sound/interact.play()
	elif moveNumber == 4:
		textShout("Unlocked the Spin!")
		$player/interact_sound/interact.play()
	elif moveNumber == 7:
		textShout("Unlocked the BackFlip!")
		$player/interact_sound/interact.play()
	else:
		print("WARNING: celebrateNewMove called with unusual moveNumber")
	updateHint()

func updateHint():
	if $"player/danceHUD/HUD2-locked".visible == true:
		textHint("Hint: Do move one five times!")
	elif $"player/danceHUD/HUD3-locked".visible == true:
		textHint("Hint: Go to the waves to unlock the wave")
	elif $"player/danceHUD/HUD4-locked".visible == true:
		textHint("Hint: Bump into penguins")
	elif $"player/danceHUD/HUD5-locked".visible == true:
		textHint("Hint: Find the disco ball at the night market")
	elif $"player/danceHUD/HUD6-locked".visible == true:
		textHint("Hint: Bump into someone at the night market")
	else:
		textHint("Nothing left to do but dance!")

func textHint(msg):
	$TextHint.text = msg
	print(msg)
