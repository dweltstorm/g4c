extends Node2D

@onready var sprite = $Sprite2D
@onready var char1 = get_node("../Char1")
@onready var char2 = get_node("../Char2")

func get_pos():
	return Vector2((char2.position.x + char1.position.x)/2, (char2.position.y + char1.position.y)/2)

func get_distance():
	return char2.position.distance_to(char1.position)

func get_new_scale():
	return (get_distance() / sprite.texture.get_size().x) * 2
	
func _physics_process(_delta):
	position = get_pos()
	scale.x = get_new_scale()
	look_at(char2.position)
