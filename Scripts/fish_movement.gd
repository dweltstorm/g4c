extends CharacterBody2D

var speed : float = 200
@onready var target : Node2D = get_parent().get_node("Player").char1
@onready var direction = (target.global_position - position).normalized()

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
