extends Node2D

var menuSetting
var close_setting

func _ready():
	menuSetting = $MenuCaiDat
	menuSetting.hide()
	close_setting = menuSetting.get_node("closeButton")
	

func _on_button_setting_pressed():
	if menuSetting.is_visible():
		menuSetting.hide()
	else:
		menuSetting.show()
