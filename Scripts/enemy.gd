extends CharacterBody2D

@export var statistics:StatisticsComponent
@export var detectArea:DetectArea
@export var attack:AttackComponent
@export var navAgent:NavigationAgent2D
@export var acel=7

var check_left_right=1

#func _ready():
#	if detectArea.player_chase==true:
#		makepath()
	
#func _process(delta):
#	if detectArea.player_chase==true:
#		makepath()
	
func _physics_process(delta):
	#Check enemy type
	if statistics.enemy_type==0:
		#Flip direction
		if velocity.x<0 and check_left_right==0:
			check_left_right=1
			scale.x*=-1
		elif velocity.x>0 and check_left_right==1:
			check_left_right=0
			scale.x*=-1
		PhysicsMovement(delta)
	else:
		UnphysicsMovement(delta)
	
func UnphysicsMovement(delta):
	pass
func PhysicsMovement(delta):
	#Move this enemy to player
	if detectArea.player_chase==true:
		makepath()
		var dir=navAgent.get_next_path_position()- global_position
#		dir=dir.normalized()
		velocity=velocity.lerp(dir*statistics.speed*delta, acel*delta)
#		print(velocity )
		move_and_slide()
		
func makepath():
	navAgent.set_target_position(detectArea.player.global_position)


