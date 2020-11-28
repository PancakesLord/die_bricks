extends RigidBody2D

export var speedup = 5 #valeurs à trouver en testant '^'
const MAXSPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


func _process(delta):
	var bodies = get_colliding_bodies() 
#renvoie toutes les entitées touchées par l'objt
# => renvoie une liste
#Ne pas oublier d'activer "contact monitoring" pour utiliser la fonc' get_colliding_bodies()
#set le nb de contact à report pour activer la fonc
	for body in bodies:
		if body.is_in_group("Bricks"): #vérifie si j'ai percuté une brique
			body.queue_free() #supprime/détruit la brique
			get_node("/root/Level").remaining -= 1

		if body.get_name() == "Paddle":

			var speed = get_linear_velocity().length()
			#balance la speed actuelle (Vector2 => x, y)
			#length = VecteurM, avec x = x et y = y
			#ex: length(Vector2(3, 5)) = 2
			#on prend la longueur car on veut juste un nb 
			#la d de l'origine à y en 3 tic (0.016sec, donc on a une v)

			var direction = get_position() - body.get_node("Anchor").get_global_position()
			#on va la longueur du vecteur balle -> Anchor
			var velocity = direction.normalized()*min(speed+speedup, MAXSPEED)
			#le normalized vecteur est juste un vecteur avec une norme de 1 (une direction en somme)
			#on multipli le vecteur par la speed*l'ajout de speed soit par la speed max
			#ce qui défini la velocity (l'accélération')
			#on n'applique pas delta (qui est le t) car on set l'acc' à velocity
			#elle ne se refresh que lorsqu'elle touchera un autre objet qui set la veloc'
			set_linear_velocity(velocity)
		
		if body.is_in_group("Ball"):
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized()*min(speed+speedup, MAXSPEED)
			set_linear_velocity(velocity)


	if get_position().y > get_viewport_rect().end.y:
		get_node("/root/Level").lives -= 1
		queue_free()

