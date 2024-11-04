extends CanvasLayer

@onready var transition_label: Label = $Control/TransitionLabel

func change_scene(target:String, prompt:String) -> void:
	transition_label.text = prompt
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")
	
	
