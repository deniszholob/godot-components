extends CanvasLayer

@onready var close = %Close
const DEMOS: String = ("res://views/demos.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	close.pressed.connect(func(): _change_scene(DEMOS))

func _change_scene(scene:String) -> void:
	get_tree().change_scene_to_file(scene)
