extends Node2D

var menuSetting
var trangChuNode


func _ready():
	trangChuNode = get_node("/root/TrangChu")
	menuSetting = trangChuNode.get_node("menuSetting")
	
func _on_button_close_pressed():
	if menuSetting.is_visible():
		menuSetting.hide()
	else:
		menuSetting.show()
