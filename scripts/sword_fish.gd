extends Area2D

@export var fish_speed : float =-380
@export var fish_type: String = "special"
@export var require_min_score: int = 25   
var is_dead : bool = false

func _physics_process(delta: float) ->void:
	if not is_dead:
		position+=Vector2(fish_speed,0)* delta
	if position.x < -700:
		queue_free()


func get_fish_type() -> String:
	return fish_type


func get_required_score() -> int:
	return require_min_score


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var current_score = Global.get_current_score()
		
		
		if current_score >= require_min_score:
			Global.add_score(2)
			is_dead = true
			if is_dead and $getScore:
				$getScore.play()
			
			
			await get_tree().create_timer(0.09).timeout
			call_deferred("queue_free")
		
		
			
			
			
