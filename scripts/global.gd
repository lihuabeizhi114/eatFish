extends Node

var final_score: int = 0
var current_score: int = 0
var sharks_eaten: int = 0  
var target_sharks: int = 10 

func set_final_score(score: int):
	final_score = score
	
func get_final_score() -> int:
	
	return final_score

func set_current_score(_score: int):
	current_score = _score

func get_current_score() -> int:
	return current_score

func add_score(points: int):
	current_score += points
	
func add_shark_eaten():
	sharks_eaten += 1
	print("已吃掉鲨鱼数量: ", sharks_eaten, "/", target_sharks)
	
	
	if sharks_eaten >= target_sharks:
		get_tree().call_deferred("change_scene_to_file","res://Scene/game_win.tscn" )

func get_sharks_eaten() -> int:
	return sharks_eaten

func reset_sharks_eaten():
	sharks_eaten = 0
