extends Node2D

var menuTamDung
var buttonTamDung
var isPaused = false


func _ready():
	menuTamDung = $CanvasLayer/menu_tam_dung
	buttonTamDung = $CanvasLayer/button_tam_dung
	menuTamDung.hide()
	

	
func _on_button_tam_dung_pressed():
	$sfx.play()
	get_tree().paused = true
	menuTamDung.show()
	buttonTamDung.hide()



	
