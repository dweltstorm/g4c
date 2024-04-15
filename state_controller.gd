extends Node
@export var score : int = 0
@export var lives : int = 3
@export var projectile_speed : int = 200
@onready var ui = get_parent().get_node("UI")
var last_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
