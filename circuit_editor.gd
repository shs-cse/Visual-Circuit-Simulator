extends Node2D

func _ready():
	pass

#const AVAILABLE_COMPONENsTS := [
#	"TVSDIODE",
#	"SW",
#	"G2",
#	"ZENER",
#	"DIODE",
#	"VARACTOR",
#	"NPN",
#	"BI2",
#	"SCHOTTKY",
#	"NJF",
#	"SOATHERM-HEATSINK",
#	"ISO7637-2",
#	"FERRITEBEAD",
#	"SOATHERM-NMOS",
#	"LOAD",
#	"IND2",
#	"BI",
#	"H",
#	"SOATHERM-PCB",
#	"PJF",
#	"MESFET",
#	"FERRITEBEAD2",
#	"TLINE",
#	"LTLINE",
#	"LOAD2",
#	"CURRENT",
#	"BV",
#	"NPN4",
#	"LPNP",
#	"NMOS",
#	"POLCAP",
#	"PMOS4",
#	"CSW",
#	"E",
#	"NPN3",
#	"G",
#	"F",
#	"RES2",
#	"NPN2",
#	"ISO16750-2",
#	"RES",
#	"IND",
#	"E2",
#	"PNP",
#	"PNP4",
#	"LED",
#	"NMOS4",
#	"CAP",
#	"VOLTAGE",
#	"PNP2",
#	"PMOS",
#]
#
#class Component:
#	var type := ""
#	var name := ""
#	var value = null
#	var origin := Vector2i.ZERO
#	var is_mirrored := false
#	var rotation_deg := 0
#
#	func _to_string():
#		return (
#			"Component(type: %s" % self.type +
#			", name: %s" % self.name + 
#			", value: %s" % self.value + 
#			", origin: %s" % self.origin + 
#			(", mirrored" if self.is_mirrored else "") + 
#			((", rotation: %s deg" % self.rotation_deg) if self.rotation_deg % 360 else "")
#		)
#
##enum Component{
##	type,
##	name,
##	value,
##	origin,
##	is_mirrored,
##	rotation_deg
##}
#
#func _on_asc_file_selected(path):
#	print(path)
#	var file := FileAccess.open(path, FileAccess.READ)
#	if not file:
#		print("File could not be accessed.")
#		return
#	# file found successfully
#	var circuit_data := file.get_as_text() # UTF-8
#	if len(circuit_data) <= 1:
#		print("trying to read in UTF-16 LE")
#		circuit_data = file.get_buffer(file.get_length()).get_string_from_utf16()
#
#	var wires := []
#	var components : Array[Component]= []
#	var labeled_nodes := {}
#
#	for line in circuit_data.split("\n"):
#		var words := line.split(" ")
#		var data_type := words[0].to_upper()
#		match data_type:
#			"WIRE":
#				wires.append(
#					{data_type: {
#						"start": Vector2i(int(words[1]), int(words[2])),
#						"end": Vector2i(int(words[3]), int(words[4]))
#					}}
#				)
#			"FLAG":
#				var pos := Vector2i(int(words[1]), int(words[2]))
#				if labeled_nodes.has(words[-1]):
#					labeled_nodes[words[-1]].append(pos)
#				else:
#					labeled_nodes[words[-1]] = [pos]
#			"SYMBOL": # add new component
#				var this_component := Component.new()
#				this_component.type = words[1].to_upper()
#				this_component.origin = Vector2i(int(words[2]), int(words[3]))
#				this_component.is_mirrored = words[-1][0] in "Mm"
#				this_component.rotation_deg = int(words[-1].substr(1)) % 360
#				components.append(this_component)
#
##				components.append({
##					Component.type: words[1].to_upper(),
##					Component.origin: Vector2i(int(words[2]), int(words[3])),
##					Component.is_mirrored: words[-1][0] in "Mm",
##					Component.rotation_deg: int(words[-1].substr(1)) % 360
##				})
#			"SYMATTR": # update last component properties
#				if words[1].matchn("InstName"):
#					components[-1].name = words[-1]
##					components[-1][Component.name] = words[-1]
#				elif words[1].matchn("Value"):
#					components[-1].value = float(words[-1]) if words[-1].is_valid_float() else words[-1]
#
#					if words[-1].is_valid_float():
#						components[-1].value = float(words[-1])
##						components[-1][Component.value] = float(words[-1])
#					else:
#						components[-1].value = words[-1]
##						components[-1][Component.value] = words[-1]
#			_:
#				print(words)
##		components.append(last_component)
#
#	print(JSON.stringify(components, "  "))
#
