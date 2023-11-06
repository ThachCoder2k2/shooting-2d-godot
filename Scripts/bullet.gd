extends Area2D
class_name Bullet
#@onready var tilemap = get_tree().root.get_node("Main/Map")

@export var animation_player:AnimationPlayer

#Statistics
@export var speed =200
@export var direction : Vector2
@export var damage=40

#While flying controller
var check_flying=false
var timer = Timer.new()
@export var existing_time=5

func _ready():
	#Control the existing time of bullets through time
	check_flying=true
	timer.wait_time = existing_time
	timer.one_shot = true
	timer.autostart = true
	add_child(timer)


func _process(delta):
	#Move the bullets
	var velocity=speed * delta * direction
	if check_flying==true:
		position+=velocity
#	#Check the time to destroy
	if timer.is_stopped():
		OnDestroy()
	

func OnDestroy():
	animation_player.play("hit")
	await animation_player.animation_finished
	queue_free()



func _on_area_entered(area):
	#Check if that was a player then nothing happens
	if area.name == "Player":
		return
	#if it lands on a hitcomponent then it gonna get being damaged
	if area is HitComponent:
		check_flying=false
		area.damage(damage)
		OnDestroy()
	pass
