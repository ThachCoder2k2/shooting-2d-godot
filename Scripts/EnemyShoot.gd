extends Node2D
class_name EnemyShoot

@export var fire_rate:float=2
@export var detect_area:DetectArea
@export var detect_attack:DetectAttack

var lastShoot:float=0
var firetime:float=1/fire_rate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if detect_area.player_chase==true and detect_attack.player_in_attack_range==false:
		print("Shooting")
	elif detect_area.player_chase==true and detect_attack.player_in_attack_range==true:
		print("Charging")
