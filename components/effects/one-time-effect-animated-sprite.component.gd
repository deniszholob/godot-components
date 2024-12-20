# Self destructable AnimatedSprite when animation is stopped
class_name OneTimeEffectAnimatedSpriteComponent extends AnimatedSprite2D

func _ready() -> void:
	# Free this node when the animation is finished
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
