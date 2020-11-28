extends KinematicBody2D #Extend => Herite from

const ball_scene = preload("res://mini scenes/Ball_scenes.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)


func _process(delta):
	var y = get_position().y #Récup' la pos' Y de l'objet au début
	var x = get_viewport().get_mouse_position().x 
	#Permet de traquer la position de la souris 
	#(la méthode .x et .y permettent de récuperer non pas un vecteur mais seulement une des 
	#coordonnée)
	set_position(Vector2(x, y)) #Place l'objet en fonction d'un vecteur de coordonée (x, y)

func _input(event):
	if event.is_action_pressed("shoot_ball"):
		if get_node("/root/Level").ball_left == 0:
			pass
		else:
			var ball = ball_scene.instance()
			ball.set_position(get_position()-Vector2(0, 16))
			get_tree().get_root().add_child(ball)
			get_node("/root/Level").ball_left -= 1
		#on ajoute à la node racine (World) un enfant de l'instance ball
