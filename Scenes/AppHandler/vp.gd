extends Viewport

signal propagate_data(type, data)

func propagate_data(type, data):
	emit_signal("propagate_data", type, data)
