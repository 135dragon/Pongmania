extends CharacterBody2D

signal brickBreak

func special(_a):
	brickBreak.emit()
	self.queue_free()
