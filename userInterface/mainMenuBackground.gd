extends StaticBody 
#This script controls the camera movement on the menu screen

onready var camera = get_node("cameraMove")
onready var pelicant = get_node("characters/pelicant_main/AnimationPlayer")
onready var main = get_node("characters/mainchar_main/AnimationPlayer")
onready var blocky = get_node("characters/blockys_npcdance/AnimationPlayer")
onready var meshy = get_node("characters/meshys_npcdance/AnimationPlayer")
onready var pelicant2 = get_node("characters/pelicant_npcdance/AnimationPlayer")
onready var robot = get_node("characters/robotCharacter/InteraNPC/AnimationPlayer")
onready var shuhangnpc = get_node("characters/Shuhang_NPC/AnimationPlayer")
onready var light1 = get_node("lights/SpotLight")
onready var light2 = get_node("lights/SpotLight2")
onready var light3 = get_node("lights/SpotLight3")
onready var light4 = get_node("lights/SpotLight4")
onready var light5 = get_node("lights/SpotLight5")
onready var light6 = get_node("lights/SpotLight6")
onready var light7 = get_node("lights/SpotLight7")
onready var light8 = get_node("lights/SpotLight8")
onready var light9 = get_node("lights/SpotLight9")
onready var light10 = get_node("lights/SpotLight10")
var colourChange = 0.0



func _process(delta):
	camera.rotate_y(deg2rad(0.0)) 
	camera.translate(Vector3(0, 0, 0))
	pelicant.play("Idle",0.1, 1.4)
	main.play("Disco",0.1, 1.35)
	blocky.play("Chacha",0.1, 1.4)
	meshy.play("Jumpy",0.1, 1.4)
	pelicant2.play("Idle",0.1, 1.4)
	robot.play("dance_origin",0.1, 1.35)
	shuhangnpc.play("dance_upgrade", 0.1, 1.35)
	
	light1.light_color = Color.from_hsv((colourChange+0.8), 1.0, 1.0)
	light2.light_color = Color.from_hsv((colourChange+4.7), 1.0, 1.0)
	light3.light_color = Color.from_hsv((colourChange+0.5), 1.0, 1.0)
	light4.light_color = Color.from_hsv((colourChange+0.4), 1.0, 1.0)
	light5.light_color = Color.from_hsv((colourChange+3.3), 1.0, 1.0)
	light6.light_color = Color.from_hsv((colourChange+0.2), 1.0, 1.0)
	light7.light_color = Color.from_hsv((colourChange+0.6), 1.0, 1.0)
	light8.light_color = Color.from_hsv((colourChange+1.0), 1.0, 1.0)
	light9.light_color = Color.from_hsv((colourChange+1.5), 1.0, 1.0)
	light10.light_color = Color.from_hsv((colourChange+2.9), 1.0, 0.5)
	colourChange = colourChange + 0.001
	
