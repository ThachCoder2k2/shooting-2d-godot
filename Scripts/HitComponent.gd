extends Area2D
class_name HitComponent

@export var health_component:StatisticsComponent
@export var sprite:Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func damage(damage):
	damage_effect()
	health_component.health-=damage
	print(health_component.health)
	if health_component.health<=0:
		get_parent().queue_free()

func damage_effect():
	if get_parent().name=="Enemy":
		sprite.modulate=Color.RED
		await get_tree().create_timer(0.1).timeout
		sprite.modulate=Color.WHITE
	else:
		sprite.modulate=Color(2,2,2)
		await get_tree().create_timer(0.1).timeout
		sprite.set_visible(true)
		await get_tree().create_timer(0.1).timeout
		sprite.set_visible(randi_range(0,1))
		await get_tree().create_timer(0.1).timeout
		sprite.set_visible(true)
		sprite.modulate=Color.WHITE
#		sprite.modulate=Color.WHITE
