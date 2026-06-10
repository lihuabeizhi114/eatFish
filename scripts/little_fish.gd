extends Area2D

@export var fish_speed : float =-180
var is_dead : bool = false

func _ready() -> void:
	scale = Vector2(0.5,0.5)

func _physics_process(delta: float) ->void:
	if not is_dead:
		position+=Vector2(fish_speed,0)* delta
	if position.x < -700:
		queue_free()
	
func get_fish_type() -> String:
	return "normal"  # 普通鱼

func get_required_score() -> int:
	return 0 

	
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Global.add_score(1) 
		is_dead = true
		if is_dead and $getScore:
			$getScore.play()
		
		
		await get_tree().create_timer(0.09).timeout
		call_deferred("queue_free")
		
	
		
