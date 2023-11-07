extends Node2D
class_name CloseRangedAttack

@export var statisticsComponent:StatisticsComponent

func Attack():
	match statisticsComponent.enemy_type:
		0:
			pass
		1:
			FlyingAttack()


func FlyingAttack():
	pass
