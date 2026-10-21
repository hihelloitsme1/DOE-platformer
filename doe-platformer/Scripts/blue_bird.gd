extends AnimatableBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var bounds: Vector2;
@export var speed: float = 1;
@export var start_direction: int = 1;
var direction: int;

func _ready():
	direction = start_direction;

func _physics_process(delta):
	if (animated_sprite_2d.animation != "hit"):
		animated_sprite_2d.play("fly");
		position.x += speed * direction * Engine.time_scale;
		print(position.x)
	if position.x < bounds.x or position.x > bounds.y:
		direction *= -1;
		position.x = bounds.x if position.x < bounds.x else bounds.y;
		animated_sprite_2d.flip_h = direction > 0

func die():
	get_tree().reload_current_scene();


func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite_2d.animation == "hit"):
		queue_free();


func _on_animated_sprite_2d_animation_changed():
	if (animated_sprite_2d):
		if (animated_sprite_2d.animation == "hit"):
			speed = 0;
#Le Tricheur à l'As de Carreau est une peinture faite par George de la Tour en 1635. Cette peinture est faite d'huile sur toile. Ces dimensions sont de 1,06m hauteur et 1,46m largeur. Le Misanthrope est un livre écrit par Molière. Ce livre est plus récent mais les deux œuvres ont beaucoup de similitudes et différences et partagent des thèmes importants. Quand plusieurs personnes retiennent collectivement des informations à quelqu'un, est-ce-que ça serait plus nocif ou plus évident pour cette personne comparé à un mensonge fait par un individu? On pourrait répondre à cette question en comparant les deux œuvres.
#Une similarité entre cette peinture et ce livre est que plusieurs personnes collaborent pour prendre quelque chose de quelqu’un. Dans la peinture, on peut voir quatre signes que les trois sur la gauche travaillent ensemble et cache leur plan du jeune homme. Premièrement, la courtisane utilise son doigt pour signaler au tricheur de mettre leur plan en action. Deuxièmement, tous les trois sur la gauche ne peuvent pas regarder le jeune homme et sont très discrets. Cela montre comment ils ne veulent pas qu'une d’eux révèle leur plan. Troisièmement, le mur derrière le jeune homme est clair et rapprochée. En outre, le mur derrière les trois figures sur la gauche est plus foncé. Cette différence en couleur sépare les personnages en deux groupes. Finalement, les trois qui savent ce qui ce passe sont plus rapprochés de l’un à l'autre et le jeune homme est séparé. Cela est une autre méthode que George de la Tour utilise pour montrer les deux groupes de personnages. Similairement, dans Le Misanthrope, Alceste trouve que d'autres personnes travaillent ensemble pour lui nuire. Au fin du livre, Alceste dit qu’il est “trahi de toutes parts” (Molière 176). Cet hyperbole montre comment Alceste trouve que tout le monde est contre lui. Ça souligne l’existence de collaboration dans les actions prises contre lui. En conclusion, ces deux œuvres soulignent comment les personnes travaillent ensemble pour trahir les autres.
#Une deuxième similarité entre ces deux œuvres et comment ils emphasent comment les conséquences peuvent être grave pour la cible de cette trahison. La scène dans cette peinture montre des enjeux élevés. On peut voir comment un grand nombre de pièces est distribué sur la table. Cela montre que les conséquences financières pour le perdant sont très sérieuses. Molière a aussi montré ce problème avec le dialogue d’Alceste. Alceste dit: “Il trouve, en égorgeant, moyen d’avoir raison” (Molière 155). Molière utilise cette métaphore pour montrer comment Alceste voit cette trahison. Égorger est un mot très fort et Alceste l’utilise pour décrire un mensonge. Il compare cette trahison a sa mort, qui montre comment, pour lui, les conséquences de ces événements changeront sa vie. Cependant, cette similarité cache une différence très importante. Dans la peinture, le jeune homme a des vêtements rouges et luxurieux. Sa façon de s’habiller montre sa richesse et comment, même s’il perd l’argent sur la table, il aura quand même les ressources pour survivre. Au contraire, Alceste face des conséquences légales qui auront un impact plus grand sur sa vie. En conclusion, cette similarité montre comment les mensonges peuvent être très dangereux pour leurs cibles.
#Une différence clé du livre à la peinture est comment Alceste connaît les mensonges. Dans Le Misanthrope, Alceste passe beaucoup de son temps à critiquer les mensonges qu’il rencontre. En revanche, dans la peinture, le jeune homme ne voit pas comment ses adversaires trichent. Ses yeux sont focalisés sur ses cartes et il pense qu’au stratégie pour gagner, donc son attention n’est pas sur les cartes cachées derrière le dos du tricheur. La comparaison de ces éléments montre comment c'est très important de pratiquer la vigilance. En conclusion, les deux artistes disent aux lecteurs et observateurs qu’ils doivent rester prudents pour éviter d’être trompés.
#Pour terminer, quand plusieurs personnes retiennent collectivement des informations à quelqu'un, ça serait plus nocif et dangereux pour cette personne comparé à un mensonge fait par un individu. Le message le plus important de cette comparaison est que quand quelqu’un nous invite à prendre part dans un mensonge, c’est notre obligation d’informer la cible de cette trahison.
