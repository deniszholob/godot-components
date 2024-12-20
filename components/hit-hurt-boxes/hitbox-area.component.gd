# Give the component a class name so it can be instanced as a custom node
class_name HitboxAreaComponent extends Area2D

# Create a signal for when the hitbox hits a hurtbox
signal hit_hurtbox(hurtbox: HurtboxAreaComponent)

# Export the damage amount this hitbox deals
@export var damage = 1.0

func _ready():
	# Connect on area entered to our hurtbox entered function
	area_entered.connect(_on_hurtbox_entered)

# TODO: Double Check types
func _on_hurtbox_entered(hurtbox: HurtboxAreaComponent):
	# Make sure the area we are overlapping is a hurtbox
	if not hurtbox is HurtboxAreaComponent: return
	# Make sure the hurtbox isn't invincible
	if hurtbox.is_invincible: return
	# Signal out that we hit a hurtbox (this is useful for destroying projectiles when they hit something)
	hit_hurtbox.emit(hurtbox)
	# Have the hurtbox signal out that it was hit
	hurtbox.hurt.emit(self)
