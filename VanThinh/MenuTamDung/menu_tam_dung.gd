extends Node2D


var menuSetting
var HomeNode 
var parentSceneRoot
var menuTamDung
var buttonTamDung
var scene_change_timer
func _ready():	
	scene_change_timer = $Timer
	HomeNode = get_node("/root/TrangHome")
	menuSetting = HomeNode.get_node("CanvasLayer/menuSetting")
	menuTamDung = HomeNode.get_node("CanvasLayer/menu_tam_dung")
	buttonTamDung = HomeNode.get_node("CanvasLayer/button_tam_dung")

	menuSetting.hide()
	

func _on_button_caidat_button_up():
	$sfx.play()
	if menuSetting.is_visible():
		menuSetting.hide()
	else:
		menuSetting.show()



func _on_button_home_button_up():
	$sfx.play()
	get_tree().paused = false
	scene_change_timer.start() 


func _on_button_play_button_up():
	$sfx.play()
	get_tree().paused = false
	menuTamDung.hide()
	buttonTamDung.show()

	


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://VanThinh/TrangChu/trang_chu.tscn")
