class_name SI 
extends Node

enum UNIT {
	OHM,
	VOLT,
	AMPERE,
}
enum PREFIX {
	TERRA = 12,
	GIGA = 9,
	MEGA = 6,
	KILO = 3,
	NONE = 0,
	MILLI = -3,
	MICRO = -6,
	NANO = -9,
	PICO = -12,
	FEMTO = -15
}
## Dictionary mapping of unit enum to their string represtaion
const UNIT_REPRE_DICT := {
	UNIT.OHM: "Ω",
	UNIT.VOLT: "V",
	UNIT.AMPERE: "A"
}
## Dictionary mapping of prefix unit enum to their string represtaion
const PREFIX_REPR_DICT := {
	PREFIX.TERRA: "T",
	PREFIX.GIGA: "G",
	PREFIX.MEGA: "Meg",
	PREFIX.KILO: "k",
	PREFIX.NONE: "",
	PREFIX.MILLI: "m",
	PREFIX.MICRO: "µ",
	PREFIX.NANO: "n",
	PREFIX.PICO: "p",
	PREFIX.FEMTO: "f"
}
## Just the numerical part of the component value (without the SI unit/prefix)
@export var number := NAN:
	set(_number):
		print("setting number of si quantity")
		number = _number
#		var returned_values := compact_notation(_number, prefix)
#		if number != returned_values[0]:
#			number = returned_values[0]
#		if prefix != returned_values[1]:
#			prefix = returned_values[1]
		value = number * 10**prefix

## Just the SI unit prefix part of the component value (without the unit)
@export var prefix := PREFIX.NONE:
	set(_prefix):
		print("setting prefix of si quantity")
		prefix = _prefix
#		var returned_values := compact_notation(number, _prefix)
#		if number != returned_values[0]:
#			number = returned_values[0]
#		if prefix != returned_values[1]:
#			prefix = returned_values[1]
		value = number * 10**prefix
		
## SI unit of the component
@export var unit := UNIT.OHM
## Numerical value in SI unit
var value := NAN:
	set(_value):
		print("trying to change %s" % _value)

func _init(_number:float, _prefix:PREFIX, _unit:UNIT):
	self.number = _number
	self.prefix = _prefix
	self.unit = _unit

static func compact_notation(_number:float, _prefix:PREFIX) -> Array:
	print("before: %3.2f %s" % [_number, PREFIX_REPR_DICT[_prefix]])
	while absf(_number) >= 1e3 and _prefix < PREFIX.values().max():
		_number /= 1e3
		_prefix += 3
	while absf(_number) < 1 and _prefix <= 0 and _prefix > PREFIX.values().min():
		_number *= 1e3
		_prefix -= 3
#	self.number = _number
#	self.prefix = _prefix
#	self.value = number * 10**prefix
	print("after: %s %s" % [_number, PREFIX_REPR_DICT[_prefix]])
	return [_number, _prefix]
	
	
	
