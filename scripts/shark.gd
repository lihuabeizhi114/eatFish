extends Area2D

@export var fish_speed : float = 300  # 鲨鱼可以比剑鱼快一些
@export var fish_type: String = "shark"  # 设置为鲨鱼类型
@export var require_min_score: int = 150  # 需要150分才能吃
var is_dead : bool = false

func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(fish_speed, 0) * delta
	if position.x > 1000:
		queue_free()

func get_fish_type() -> String:
	return fish_type

func get_required_score() -> int:
	return require_min_score

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var current_score = Global.get_current_score()
		
		# 只有当分数足够时才加分
		if current_score >= require_min_score:
			Global.add_score(5)
			Global.add_shark_eaten() 
			is_dead = true
			if is_dead and $getScore: 
				$getScore.play()
			
			
			await get_tree().create_timer(0.09).timeout
			call_deferred("queue_free")
