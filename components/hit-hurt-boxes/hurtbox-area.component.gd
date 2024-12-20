# Give the component a class name so it can be instanced as a custom node
class_name HurtboxAreaComponent extends Area2D

# Create a signal for when this hurtbox is hit by a hitbox (called in hitbox)
signal hurt(hitbox: HitboxAreaComponent)

# Create the is_invincible boolean
var is_invincible: bool = false :
	# Here we create an inline setter so we can disable and enable collision shapes on
	# the hurtbox when is_invincible is changed.
	set(v):
		is_invincible = v
		# Disable any collisions shapes on this hurtbox when it is invincible
		# And reenable them when it isn't invincible
		for child in get_children():
			if not child is CollisionShape2D and not child is CollisionPolygon2D: continue
			# Use call deferred to make sure this doesn't happen in the middle of the
			# physics process
			child.set_deferred("disabled", is_invincible)
