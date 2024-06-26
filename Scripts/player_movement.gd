extends Node2D

var speed : float = 400
var max_distance : float = 500
@export var score : int = 0
@export var max_hearts : int = 3
@export var hearts : int = max_hearts
@export var projectile_speed : int = 200
@onready var char1 : CharacterBody2D = $Char1
@onready var char2 : CharacterBody2D = $Char2
@onready var net : Area2D = $Net
@onready var fish = load("res://Scenes/fish.tscn")

signal hearts_changed(hearts)
signal score_changed(score)

func get_input():
	char1.velocity = Input.get_vector("left", "right", "up", "down") * 400
	char2.velocity = Input.get_vector("left2", "right2", "up2", "down2") * 400
	
func _physics_process(_delta):
	get_input()
	char1.move_and_slide()
	char2.move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		var new_fish = fish.instantiate()
		new_fish.position.x = 1000
		get_parent().add_child(new_fish)
	
	var distance = char1.global_position.distance_to(char2.global_position)
	
	if distance > max_distance:
		var direction = (char2.global_position - char1.global_position).normalized()
		var move_vector = direction * (distance - max_distance) * 0.5
		char2.global_position -= move_vector
	
	


func _on_net_body_entered(body: Node2D):
	if body is Fish: 
		body.queue_free()
		hearts -= 1
		score += 1
		emit_signal("hearts_changed", hearts)
		emit_signal("score_changed", score)
		var new_fish = fish.instantiate()
		new_fish.position.x = 1000
		get_parent().call_deferred("add_child", new_fish)
		projectile_speed *= 1.05
