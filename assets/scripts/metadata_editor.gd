extends Node2D

@onready var line_edit_id: LineEdit = $Control/VBoxContainer/HBoxContainer/LineEditID
@onready var line_edit_name: LineEdit = $Control/VBoxContainer/HBoxContainer2/LineEditName
@onready var line_edit_author: LineEdit = $Control/VBoxContainer/HBoxContainer3/LineEditAuthor
@onready var line_edit_desc: LineEdit = $Control/VBoxContainer/HBoxContainer4/LineEditDesc
@onready var line_edit_prefix: LineEdit = $Control/VBoxContainer/HBoxContainer5/LineEditPrefix
@onready var line_edit_prio: LineEdit = $Control/VBoxContainer/HBoxContainer6/LineEditPrio
@onready var line_edit_version: LineEdit = $Control/VBoxContainer/HBoxContainer7/LineEditVersion


var mid: String
var mname: String
var mauthor: String
var mdesc: String
var mprefix: String
var mprio: int
var mversion: String
var idbanlist = ["Steamodded", "Lovely", "Balatro", "steamodded", "lovely", "balatro"]
var prefixbanlist = ["SMODS"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = 60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if line_edit_id.text:
		var idtxt = line_edit_id.text
		if idbanlist.has(idtxt):
			line_edit_id.clear()
			idtxt = ""
			push_error("Mod ID is banned, cleared.")
		elif idtxt.contains(" "):
			push_error("Mod ID contains a space, cleared.")
			line_edit_id.clear()
			idtxt = ""
		elif mid != idtxt:
			mid = idtxt
			print("ID: "+mid)
	if line_edit_name.text:
		if mname != line_edit_name.text:
			mname = line_edit_name.text
			print("Name: "+mname)
	if line_edit_author.text:
		if mauthor != line_edit_author.text:
			mauthor = line_edit_author.text
			print("Author: "+mauthor)
	if line_edit_desc.text:
		if mdesc != line_edit_desc.text:
			mdesc = line_edit_desc.text
			print("Description: "+mdesc)
	if line_edit_prefix.text:
		var idpre = line_edit_prefix.text
		if prefixbanlist.has(idpre):
			line_edit_prefix.clear()
			idpre = ""
			push_error("Mod prefix is banned, cleared.")
		elif idpre.contains(" "):
			line_edit_prefix.clear()
			idpre = ""
			push_error("Mod prefix contains a space, cleared.")
		elif mprefix != idpre:
			mprefix = idpre
			print("Prefix: "+mprefix)
	if line_edit_prio.text:
		var modprio = line_edit_prio.text
		if modprio.is_valid_int():
			modprio = modprio.to_int()
			if modprio != mprio:
				mprio = modprio
				print("Priority: "+str(mprio))
		else:
			line_edit_prio.clear()
			modprio = ""
	if line_edit_version.text:
		var vertxt: String = line_edit_version.text
		if vertxt.length() >= 1 and vertxt.count(".") == 2 and not vertxt.bigrams().has("..") and not vertxt.begins_with(".") and not vertxt.ends_with("."):
			line_edit_version.set("theme_override_colors/font_color",Color.SEA_GREEN)
			if mversion != vertxt:
				mversion = vertxt
				print("Version: "+mversion)
		else:
			line_edit_version.set("theme_override_colors/font_color",Color.FIREBRICK)

var finalOut
func _on_button_pressed() -> void:
	if mid and mname and mauthor and mdesc and mprefix and mprio and mversion:
		finalOut = {
			"id" : mid,
			"name" : mname,
			"author" : [mauthor, "NovaBalatroEditor"],
			"description" : mdesc,
			"prefix" : mprefix,
			"priority" : mprio,
			"version" : mversion,
		}
		var save_file = FileAccess.open("res://output/metadata.json",FileAccess.WRITE)
		save_file.resize(0)
		save_file.store_line(JSON.stringify(finalOut))
		save_file.flush()
