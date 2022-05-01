extends CanvasLayer


onready var desktop_scene = "res://Scenes/Desktop/Desktop.tscn"


func _on_Guest_pressed():
	get_tree().change_scene(desktop_scene)
