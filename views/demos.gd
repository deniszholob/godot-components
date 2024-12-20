extends Control

@onready var button_demo_fsm = $ScrollContainer/VBoxContainer/ButtonDemoFSM
@onready var button_demo_animated_sprite_rotation: Button = $ScrollContainer/VBoxContainer/ButtonDemoAnimatedSpriteRotation
@onready var button_demo_trasparency_zone = $ScrollContainer/VBoxContainer/ButtonDemoTrasparencyZone

const DEMO_FSM: String = "res://views/demo-fsm/demo-fsm.tscn"
const DEMO_ANIMATED_SPRITE_ROTATION: String = 'res://views/demo-animated-sprite-rotation/demo-animated-sprite-rotation.tscn'
const DEMO_TRANSPARENCY_ZONE: String = "res://views/demo-transparency-zone/demo-transparency-zone.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	button_demo_fsm.pressed.connect(func(): _change_scene(DEMO_FSM))
	button_demo_animated_sprite_rotation.pressed.connect(func(): _change_scene(DEMO_ANIMATED_SPRITE_ROTATION))
	button_demo_trasparency_zone.pressed.connect(func(): _change_scene(DEMO_TRANSPARENCY_ZONE))
	pass

func _change_scene(scene:String) -> void:
	get_tree().change_scene_to_file(scene)
