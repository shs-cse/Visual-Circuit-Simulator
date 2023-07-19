@tool
class_name Component extends Area2D

## Available types of electrical components
enum TYPE {
	RESISTOR,
	VOLTAGE_SOURCE,
	CURRENT_SOURCE,
}
## Width of a 1x1 tile in pixels
const TILE_SIZE := 20
## Dictionary mapping from component type to their corresponding unit
const unit_dict := {
	TYPE.RESISTOR: SI.UNIT.OHM,
	TYPE.VOLTAGE_SOURCE: SI.UNIT.VOLT,
	TYPE.CURRENT_SOURCE: SI.UNIT.AMPERE,
}

## Length and Width of bounding box of the electrical component occupied in the grid
@export var size := Vector2i.ZERO:
	set(_size):
		$BoundingBox.shape.size = _size * TILE_SIZE
		size = _size
		
## Type of component
@export var type := Component.TYPE.RESISTOR
## Just the numerical value of the quantity (e.g. -3.4)
@export var numerical_value := NAN:
	get:
		return self.si.number if self.si else NAN
	set(number):
		if self.si:
			var returned_values := SI.compact_notation(number, si.prefix)
			if numerical_value != returned_values[0]:
				numerical_value = returned_values[0]
			if si_unit_prefix != returned_values[1]:
				si_unit_prefix = returned_values[1]
#			numerical_value = number
#			self.si.number = self.numerical_value
#			self.si.prefix = self.si_unit_prefix
## Just the SI unit prefix of the quantity (e.g. Volt)
@export var si_unit_prefix := SI.PREFIX.NONE:
	set(prefix):
		if self.si:
			var returned_values := SI.compact_notation(si.number, prefix)
			if numerical_value != returned_values[0]:
				numerical_value = returned_values[0]
			if si_unit_prefix != returned_values[1]:
				si_unit_prefix = returned_values[1]
#			si_unit_prefix = prefix
#			self.si.number = self.numerical_value
#			self.si.prefix = self.si_unit_prefix
#@export var si_value
## SI value, prefix and unit packaged together
@onready var si := SI.new(
	self.numerical_value, 
	self.si_unit_prefix, 
	unit_dict[self.type]
)
	


## Called when the node enters the scene tree for the first time.
#func _ready():
#	$BoundingBox.shape.size = self.size * TILE_SIZE
#	self._si = SI.new(
#		self.numerical_value, 
#		self.si_unit_prefix, 
#		unit_dict[self.type]
#	)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

