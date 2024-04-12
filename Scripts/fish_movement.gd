extends CharacterBody2D
class_name Fish

var speed : float = 200
@onready var player : Node2D = get_parent().get_node("Player")
@onready var target : Node2D = player.char1
@onready var direction = (target.global_position - position).normalized()


func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()

