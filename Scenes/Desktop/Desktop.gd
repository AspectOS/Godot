extends CanvasLayer

var last_key = [false, ""]

func _ready():
	screen_metrics()
	
func pass_error(error):
	assert(true, "[ERROR]: " + error)
	OS.alert(error, "There Was An Error")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_run"):
		$AppHandler.start_app("Run")
		print("RUN")
		
	


func screen_metrics():
	print("                 [Screen Metrics]")
	print("            Display size: ", OS.get_screen_size())
	print("   Decorated Window size: ", OS.get_real_window_size())
	print("             Window size: ", OS.get_window_size())
	print("        Project Settings: Width=", ProjectSettings.get_setting("display/window/size/width"), " Height=", ProjectSettings.get_setting("display/window/size/height")) 
	print(OS.get_window_size().x)
	print(OS.get_window_size().y)


func _on_Button_pressed():
	print("exit")
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
	
func _unhandled_key_input(event):
	var e = event.as_text()
	var r = !event.is_echo()
	if not last_key[1] == e:
		last_key = [true, e]
	elif r:
		last_key = [false, e]
		
	print(last_key)
	
func propagate_data(type, data):
	if type == "StartApp":
		$AppHandler.start_app(data)
