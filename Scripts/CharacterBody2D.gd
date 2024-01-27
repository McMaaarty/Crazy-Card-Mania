extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 300.0

func _ready():
	$AnimatedSprite2D2.hide()

func _physics_process(delta):

	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if directionX || directionY:
		_animated_sprite.play("walk")
	elif _animated_sprite.get_animation() != "iddle":
		_animated_sprite.play("iddle")

	move_and_slide()


func _on_area_2d_body_entered(body):
	if(body == self):
		$AnimatedSprite2D2.show()
		$AnimatedSprite2D2.play("Transition")
		$Timer.start()
