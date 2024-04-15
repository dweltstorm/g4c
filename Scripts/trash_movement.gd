extends CharacterBody2D
class_name Trash

@onready var player : Node2D = get_parent().get_node("Player")
@onready var target : Node2D = player.char1
@onready var direction = (target.global_position - position).normalized()
@onready var state = get_parent().get_node("State")


func _physics_process(_delta):
	velocity = direction * state.projectile_speed
	move_and_slide()

