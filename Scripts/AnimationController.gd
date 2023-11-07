extends Sprite2D
class_name AnimationController


@export var detectArea:DetectArea
@export var animator:AnimationPlayer
@export var state:StateController
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state.cur_state:
		state.State.IDlE:
			animator.play("Idle")
		state.State.MOVING:
			animator.play("Moving")
		state.State.ATTACKING:
			animator.play("Attack")
	
