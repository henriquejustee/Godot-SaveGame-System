extends Area2D


func _on_body_entered(body):
	$AnimatedSprite2D.play("destroy")
	Globals.level += 1


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "destroy":
		queue_free()
	
