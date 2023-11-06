extends Node2D

var menuSetting

func _ready():
	menuSetting = $menuSetting
	menuSetting.hide()


func _on_button_caidat_pressed():
	if menuSetting.is_visible():
		menuSetting.hide()
	else:
		menuSetting.show()
