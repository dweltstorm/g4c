extends Node2D

@export var speed : float = 400
@export var max_distance : float = 500
@onready var char1 : CharacterBody2D = $Char1
@onready var char2 : CharacterBody2D = $Char2
@onready var current_char : CharacterBody2D = char1

func get_input():
	char1.velocity = Input.get_vector("left", "right", "up", "down") * 400
	char2.velocity = Input.get_vector("left2", "right2", "up2", "down2") * 400

func _physics_process(_delta):
	get_input()
	char1.move_and_slide()
	char2.move_and_slide()
	
	var distance = char1.global_position.distance_to(char2.global_position)
	
	if distance > max_distance:
		var direction = (char2.global_position - char1.global_position).normalized()
		var move_vector = direction * (distance - max_distance) * 0.5
		char2.global_position -= move_vector
		
