extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_metrics()
	
func pass_error(error):
	assert(true, "[ERROR]: " + error)
	OS.alert(error, "There Was An Error")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		$AppHandler.start_app("TestApp")


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
