extends Area2D

@export var player_chase=false
@export var player:CharacterBody2D

func _process(delta):
#	print(player_chase)
	pass

func _on_body_entered(body):
	if body.name=="Player":
		player=body
		player_chase=true



func _on_body_exited(body):
	player_chase=false



func _on_area_entered(area):
#	print(area)
	pass
