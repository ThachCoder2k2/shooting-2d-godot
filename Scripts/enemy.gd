extends CharacterBody2D

@export var statistics:StatisticsComponent
@export var detect_area:DetectArea
@export var detect_attack:DetectAttack
@export var attack:AttackComponent
@export var enemyShoot:EnemyShoot
@export var close_range_attack:CloseRangedAttack
@export var navAgent:NavigationAgent2D
@export var state:StateController
@export var timer:Timer
@export var acel=7

@export var t:float=0
var x
var y
var check_left_right=1

func _ready():
	state.cur_state=state.State.IDlE
	
#func _process(delta):
#	if detectArea.player_chase==true:
#		makepath()
	
func _physics_process(delta):
	if timer.is_stopped():
		state.allow_change_state=true
	#Check enemy type
	match statistics.enemy_type:
		0:
			#Flip direction
			if velocity.x<0 and check_left_right==0:
				check_left_right=1
				scale.x*=-1
			elif velocity.x>0 and check_left_right==1:
				check_left_right=0
				scale.x*=-1
			PhysicsMovement(delta)
		1:
			if detect_area.player_chase==true:
				if (detect_area.player.global_position-global_position).x<0 and check_left_right==0:
					check_left_right=1
					scale.x*=-1
				elif (detect_area.player.global_position-global_position).x>0 and check_left_right==1:
					check_left_right=0
					scale.x*=-1
			UnphysicsMovement(delta)
	
func UnphysicsMovement(delta):
	
#Check outside range
	if detect_area.player_chase==false and detect_attack.player_in_attack_range==false and (state.cur_state==state.State.IDlE or (state.cur_state!=state.State.IDlE and state.allow_change_state==true)):
		state.cur_state=state.State.IDlE
		t+=0.01
		var f = 2 / (3 - cos(2*t))
		x = f * cos(t)
		y = f * sin(2*t) / 2
		var vector=Vector2(x,y).normalized()
		position+=vector*statistics.speed*delta
# Check detect player range
	elif detect_area.player_chase==true and detect_attack.player_in_attack_range==false and (state.cur_state==state.State.MOVING or (state.cur_state!=state.State.MOVING and state.allow_change_state==true)):
		state.cur_state=state.State.MOVING
		enemyShoot.Shoot()
# Check in attack range
	elif detect_attack.player_in_attack_range==true and state.allow_change_state==true:
		state.cur_state=state.State.ATTACKING
		timer.start()
		state.allow_change_state=false
		close_range_attack.Attack(delta)
		
func PhysicsMovement(delta):
	#Move this enemy to player using navagent
	if detect_area.player_chase==true:
		state.cur_state=state.State.MOVING
		navAgent.set_target_position(detect_area.player.global_position)
		var dir=navAgent.get_next_path_position()- global_position
#		dir=dir.normalized()
		velocity=velocity.lerp(dir*statistics.speed*delta, acel*delta)
#		print(velocity )
		move_and_slide()
	else:
		state.cur_state=state.State.IDlE


