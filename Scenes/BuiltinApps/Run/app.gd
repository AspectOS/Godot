extends MarginContainer



func _on_Enter_pressed():
	get_parent().propagate_data("StartApp", $Stuff/Stuff/TextEdit.text)
