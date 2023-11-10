extends Node
class_name RoomProperties

enum Room {ENTRANCE, NORMAL, REWARD,BOSS,SPECICAL}

@export var level:int
@export var type:int
@export var top:bool=false
@export var bottom:bool=false
@export var left:bool=false
@export var right:bool=false
@export var next_room:TileMap
@export var previous_room:TileMap
@export var mode:bool=false

