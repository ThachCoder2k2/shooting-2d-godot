extends Sprite2D
class_name AnimationController


@export var detectArea:DetectArea
@export var animator:AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if detectArea.player_chase==false:
		animator.play("Idle")
	else:
		animator.play("Moving")
