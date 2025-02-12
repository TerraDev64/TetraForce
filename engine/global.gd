tool
extends Node

# This script will keep track of player information and other things that need to be recorded between scenes
# It will also contain non-networked functions that will need to be used throughout the game
# It's called "global" because it's stuff that isn't local to a scene

# We'll also have lists of items and enemies to easily get their path anywhere else in code

var player # this client's player

var health: float = 5
var max_health: float = 5
onready var equip_slot = {controller.B: "Sword", controller.X: "Bomb", controller.Y: ""}

var items = ["Sword", "Bow", "Bomb"]

var item_dict: Dictionary = {
	"Sword": "res://items/sword.tscn",
	"Bow": "res://items/arrow.tscn",
	"Bomb": "res://items/bomb.tscn",
}

var enemy_dict: Dictionary = {
	"Stalfos": "res://enemies/stalfos.tscn",
	"Knawblin": "res://enemies/knawblin.tscn",
}

var next_map: String = "overworld"
var next_entrance: String = "cave1"

func set_player_state() -> void:
	player.health = health
	player.MAX_HEALTH = max_health
	player.equip_slot = equip_slot
	player.items = items

func get_player_state() -> void:
	health = player.health
	max_health = player.MAX_HEALTH
	equip_slot = player.equip_slot
	items = player.items

func get_item_name(item_path: String) -> String:
	return item_dict.keys()[item_dict.values().find(item_path)]

func get_item_path(item_name: String) -> String:
	return item_dict[item_name]
