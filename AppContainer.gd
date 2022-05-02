extends Control

onready var viewport = $AppContainer/AppC/App/AppView/Viewport
onready var vpc = $AppContainer/AppC/App/AppView

export var app_path = "res://Scenes/BuiltinApps/TestApp/app.tscn"

var inst = null
var dragging = false
var mouse_pos = Vector2.ZERO
var old_pos = self.rect_position
	
func set_sprite():
	var testapp = load(app_path)
	
	inst = testapp.instance()
	
func _process(delta):
	#viewport.size = Vector2(vpc.margin_right - vpc.margin_left, vpc.margin_bottom - vpc.margin_top)
	
	
	
	if not inst == null:
		yield(VisualServer, "frame_post_draw")
		viewport.add_child(inst)
		inst = null
		
	if not dragging:
		mouse_pos = get_global_mouse_position()
		old_pos = self.rect_position
		
	if dragging:
		self.rect_position = old_pos + (get_global_mouse_position() - mouse_pos)
	
func kill():
	self.queue_free()
	

func _on_Close_pressed():
	kill()


func _on_Move_button_down():
	dragging = true


func _on_Move_button_up():
	dragging = false

func propagate_data(type, data):
	get_parent().propagate_data(type, data)

func _on_Viewport_propagate_data(type, data):
	propagate_data(type, data)
