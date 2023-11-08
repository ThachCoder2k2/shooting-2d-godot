extends Node2D

var menuSetting
var parentSceneRoot
var StreamMusic
func _ready():
	StreamMusic = $music
	parentSceneRoot = get_tree().get_current_scene()
	
	
	match parentSceneRoot.name:
		"TrangHome":
			menuSetting = parentSceneRoot.get_node("CanvasLayer/menuSetting")
			StreamMusic.stream = load("res://VanThinh/MenuCaiDat/AmThanh/Heroes_ Avatar.mp3")
			StreamMusic.play()
		"TrangChu":

			menuSetting = parentSceneRoot.get_node("menuSetting")
	
	
func _on_button_close_pressed():
	
	$sfx.play()
	if menuSetting.is_visible():
		menuSetting.hide()
	else:
		menuSetting.show()
