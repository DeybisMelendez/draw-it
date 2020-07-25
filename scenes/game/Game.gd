extends Control

export (PackedScene) var Pencil
onready var Canvas = $HBoxContainer/ViewportContainer/Viewport/Canvas
onready var ColorPencil = $HBoxContainer/ColorPicker
onready var ViewPortCanvas = $HBoxContainer/ViewportContainer
var can_draw = false
func _ready():
	ViewPortCanvas.connect("mouse_entered", self, "mouse_entered")
	ViewPortCanvas.connect("mouse_exited", self, "mouse_exited")

func mouse_entered():
	can_draw = true

func mouse_exited():
	can_draw = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("draw") and can_draw:
		var new_pencil = Pencil.instance()
		new_pencil.default_color = ColorPencil.color
		Canvas.add_child(new_pencil)
