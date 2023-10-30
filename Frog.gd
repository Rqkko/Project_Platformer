extends CharacterBody2D

var speed = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var animSprite

func _ready():
	animSprite = get_node("AnimatedSprite2D")
	
func _physics_process(delta):
	velocity.y += gravity * delta
	if (chase):
		player = get_node("../../Player/Player")
		var direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		if direction.x > 0:
			pass
		else:
			print("Left")
	move_and_slide()

func _on_player_detector_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detector_body_exited(body):
	if body.name == "Player":
		chase = false
