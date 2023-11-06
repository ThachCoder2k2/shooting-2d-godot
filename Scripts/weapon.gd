extends Node2D
class_name Weapon

#Must have components
@onready var shoot_animation:AnimationPlayer=get_node("Sprite2D/ShootAnimation")
@onready var gun_to_mouse_vector: Vector2= Vector2()
#@onready var bullet= preload("res://Scenes/bullet1.tscn")
@onready var shoot_point= $ShootPoint
@onready var rotate_rib=$RotateRib
@onready var hand

#Bullet preb
@export var bullet= preload("res://Scenes/bullet1.tscn")
#Statistics
@export_category("Gun Statistics")
@export var capacity:int
@export var magazine:int
@export var fire_rate:int
@export var damage:int


func _ready():
	hand=get_parent().get_parent()
	var gun_handle=get_parent()
	gun_handle.global_position=hand.global_position

func _process(delta):
	weaponAnimationController()
	gun_to_mouse_vector=weaponRotation()
	shoot(gun_to_mouse_vector)
	
func weaponAnimationController():
	if(Input.is_action_just_pressed("Shoot")):
		shoot_animation.stop()
		shoot_animation.play("Shoot")
		
func weaponRotation():
	var mouse_position : Vector2=get_global_mouse_position()
#	var mouse_direction : Vector2= (mouse_position-get_parent().global_position)
	var mouse_direction : Vector2= (mouse_position-get_parent().global_position)+(get_parent().global_position-rotate_rib.global_position)
	mouse_direction= mouse_direction.normalized()
	if gun_to_mouse_vector.x>=0:
		get_parent().rotation= mouse_direction.angle()
	else:
		get_parent().rotation=- mouse_direction.angle()
	
	if get_parent().scale.y==-1 and mouse_direction.x>0:
		get_parent().scale.y=1
	elif get_parent().scale.y==1 and mouse_direction.x<0:
		get_parent().scale.y=-1;
	if get_parent().scale.x==-1 and mouse_direction.x>0:
		get_parent().scale.x=1
	elif get_parent().scale.x==1 and mouse_direction.x<0:
		get_parent().scale.x=-1;
	return mouse_direction
#	
func shoot(mouse_direction):
	if(Input.is_action_just_pressed("Shoot")):
		var bullet_instance=bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.direction=gun_to_mouse_vector
		bullet_instance.position=shoot_point.global_position
#		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_instance.speed,0).rotated(bullet_instance.rotation))
	
		
