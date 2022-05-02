extends Node2D

var builtin_app_directory = "res://Scenes/BuiltinApps/"
var user_app_directory = "user://apps/"
var app_container_directory = "res://Scenes/AppHandler/AppContainer.tscn"

var app_container = load(app_container_directory)

func pass_error(error):
	$"..".pass_error(error)

func _ready():
	var f = list_files_in_directory("res://Scenes/BuiltinApps/")
	
	print(f)

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files
	
func start_app(app_name : String):
	var app = builtin_app_directory + app_name + "/app.tscn"
	
	print(app)
	
	if ResourceLoader.exists(app):
		var grabbed_app = app_container.instance()
		
		grabbed_app.app_path = app
		
		grabbed_app.set_sprite()
		
		self.add_child(grabbed_app)
	else:
		app = user_app_directory + app_name + "/app.tscn"
		
		if ResourceLoader.exists(app):
			pass
		else:
			pass_error("App '" + app_name + "' does not exist.")

func propagate_data(type, data):
	get_parent().propagate_data(type, data)
