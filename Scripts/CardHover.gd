extends Button

signal mouse_entered_area
signal mouse_exited_area
signal button_clic

func _on_area_2d_mouse_entered():
	mouse_entered_area.emit()

func _on_area_2d_mouse_exited():
	mouse_exited_area.emit()

func _on_button_down():
	button_clic.emit()
