extends Control

onready var viewport = $AppContainer/AppC/App/AppView/Viewport
onready var vpc = $AppContainer/AppC/App/AppView

export var app_path = "res://Scenes/BuiltinApps/TestApp/app.tscn"

var inst = null
	
func set_sprite():
	var testapp = load(app_path)
	
	inst = testapp.instance()
	
func _process(delta):
	viewport.size = Vector2(vpc.margin_right - vpc.margin_left, vpc.margin_bottom - vpc.margin_top)
	
	
	
	if not inst == null:
		yield(VisualServer, "frame_post_draw")
		viewport.add_child(inst)
		inst = null
	
func kill():
	self.queue_free()
	

func _on_Close_pressed():
	kill()
