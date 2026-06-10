extends Control

@export var main_menu_path: String = "res://Scene/title_screen.tscn"

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	var _error = get_tree().change_scene_to_file(main_menu_path)
	
