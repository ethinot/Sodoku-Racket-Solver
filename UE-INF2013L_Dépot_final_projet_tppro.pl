%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    TP n°6 & 7 proget    %
% Edouard THINOT p1909945 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Définition du problème : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
Règles du sudoku : 
    - case -> valeur de 1 à 9.
	- ligne -> sur un ligne n'apparait jamais la même valeur.
	- colonne -> idem que les liges.
	- carré -> valeur différente. 
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) Ecriture du programme : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
Données : 
    - 81 cases.
	- case = [numéro ligne, numéro colonne, valeur].
	- case vide : valeur = 0. 
*/
ecrit(L):-
    append(L1,LR1,L),length(L1,9),append(L2,LR2,LR1),length(L2,9),
    append(L3,LR3,LR2),length(L3,9),append(L4,LR4,LR3),length(L4,9),
    append(L5,LR5,LR4),length(L5,9),append(L6,LR6,LR5),length(L6,9),
    append(L7,LR7,LR6),length(L7,9),append(L8,L9,LR7),length(L8,9),
    write('-------------'),nl,
    affiche_une(L1),affiche_une(L2),affiche_une(L3),write('-------------'),nl,
    affiche_une(L4),affiche_une(L5),affiche_une(L6),write('-------------'),nl,
    affiche_une(L7),affiche_une(L8),affiche_une(L9),write('-------------'),nl.

affiche_une([A,Z,E,R,T,Y,U,I,O]):-
    write('|'),ecrit_un(O),ecrit_un(I),ecrit_un(U),
    write('|'),ecrit_un(Y),ecrit_un(T),ecrit_un(R),
    write('|'),ecrit_un(E),ecrit_un(Z),ecrit_un(A),write('|'),nl.
ecrit_un([_,_,V]):-write(V).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.1) Construire une grille vide : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% grille_init(G,NC,NL) intialise la grille du sudoku avec des "0", G (résultat/grille) NL & NC (données) sont respactivement le nombre de lignes et de colonnes.

grille_init([[1,1,0]],1,1):- !. % cas d'arrêt si nous somme sur la dernière case ici 1,1.
grille_init([[NL,1,0]|G],NL,1) :- !,NLm1 is NL - 1, grille_init(G,NLm1,9). % cas ou nous somme en fin de ligne (NC = 1) donc on crée une nouvelle ligne en repartant du début (Nc = 9).
grille_init([[NL,NC,0]|G],NL,NC) :- NCm1 is NC - 1, grille_init(G,NL,NCm1). % crée les différentes colonne de 9 à 1.

/* Exemple grille_init(G,9,9), write(G).
[[9,9,0],[9,8,0],[9,7,0],[9,6,0],[9,5,0],[9,4,0],[9,3,0],[9,2,0],[9,1,0],[8,9,0],[8,8,0],[8,7,0],[8,6,0],[8,5,0],[8,4,0],[8,3,0],[8,2,0],[8,1,0],[7,9,0],[7,8,0],[7,7,0],[7,6,0],[7,5,0],[7,4,0],[7,3,0],[7,2,0],[7,1,0],[6,9,0],[6,8,0],[6,7,0],[6,6,0],[6,5,0],[6,4,0],[6,3,0],[6,2,0],[6,1,0],[5,9,0],[5,8,0],[5,7,0],[5,6,0],[5,5,0],[5,4,0],[5,3,0],[5,2,0],[5,1,0],[4,9,0],[4,8,0],[4,7,0],[4,6,0],[4,5,0],[4,4,0],[4,3,0],[4,2,0],[4,1,0],[3,9,0],[3,8,0],[3,7,0],[3,6,0],[3,5,0],[3,4,0],[3,3,0],[3,2,0],[3,1,0],[2,9,0],[2,8,0],[2,7,0],[2,6,0],[2,5,0],[2,4,0],[2,3,0],[2,2,0],[2,1,0],[1,9,0],[1,8,0],[1,7,0],[1,6,0],[1,5,0],[1,4,0],[1,3,0],[1,2,0],[1,1,0]]
G = [[9, 9, 0], [9, 8, 0], [9, 7, 0], [9, 6, 0], [9, 5, 0], [9, 4, 0], [9, 3|...], [9|...], [...|...]|...]. */

% grille(G) ou G est le résultat, grille(G) fait appelle à grille_init qui se charge de crée une grille 9 par 9 initialiser avec des zéros.

grille(G) :- grille_init(G,9,9). 

/* Exemple) grille(G), write(G) donne :

[[9,9,0],[9,8,0],[9,7,0],[9,6,0],[9,5,0],[9,4,0],[9,3,0],[9,2,0],[9,1,0],
[8,9,0],[8,8,0],[8,7,0],[8,6,0],[8,5,0],[8,4,0],[8,3,0],[8,2,0],[8,1,0],
[7,9,0],[7,8,0],[7,7,0],[7,6,0],[7,5,0],[7,4,0],[7,3,0],[7,2,0],[7,1,0],
[6,9,0],[6,8,0],[6,7,0],[6,6,0],[6,5,0],[6,4,0],[6,3,0],[6,2,0],[6,1,0],
[5,9,0],[5,8,0],[5,7,0],[5,6,0],[5,5,0],[5,4,0],[5,3,0],[5,2,0],[5,1,0],
[4,9,0],[4,8,0],[4,7,0],[4,6,0],[4,5,0],[4,4,0],[4,3,0],[4,2,0],[4,1,0],
[3,9,0],[3,8,0],[3,7,0],[3,6,0],[3,5,0],[3,4,0],[3,3,0],[3,2,0],[3,1,0],
[2,9,0],[2,8,0],[2,7,0],[2,6,0],[2,5,0],[2,4,0],[2,3,0],[2,2,0],[2,1,0],
[1,9,0],[1,8,0],[1,7,0],[1,6,0],[1,5,0],[1,4,0],[1,3,0],[1,2,0],[1,1,0]]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.2) Initialiser la grille avec les valeurs données : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valeurs_fixees([[1,1,4],[1,3,6],[1,7,3],[1,9,1],[2,3,3],[2,7,4],[3,1,5],[3,4,4],
[3,6,3],[3,9,8],[4,2,1],[4,4,7],[4,6,9],[4,8,2],[5,5,3],[6,2,5],
[6,4,1],[6,6,4],[6,8,8],[7,1,1],[7,4,3],[7,6,2],[7,9,7],[8,3,9],
[8,7,1],[9,1,8],[9,3,4],[9,7,2],[9,9,9]]).

% remplace(L,LVI,R) R (résultat) L & LVI sont des données respactivemnt L la grille vide et LVI la liste des valeurs à remplacer.

remplace([],_,[]). % cas d'arrêt, si notre grille initial est vide (car c'est elle où on "enlève" de sous liste) peu importe la liste des valeurs à remplacer on renvoie la liste vide.
remplace([[LL,CL,_]|L],LVI,[[LL,CL,V]|R]) :- member([LL,CL,V],LVI), ! ,remplace(L,LVI,R). % si notre casse à remplacer à les mêmes coordonnées que notre liste initial la valeur inital s'unifit avec le nouvelle (elle est donc remplacer). 
remplace([[LL,CL,V0]|L],LVI,[[LL,CL,V0]|R]) :- remplace(L,LVI,R). % cas invers à celui du dessus si [LL,CL,V0] n'est pas membre de LVI on ajoute [LL,CL,V0] à la grille (cela veut dire que ce n'est pas un valeur à remplacer).

% init_grille(L) ou R est le résultat initialise au complet la grille c'est à dire une grille R avec les valeurs fixées plus les case vide (0).

init_grille(R) :- grille(G),valeurs_fixees(V),remplace(G,V,R).

/* Exemple) init_grille(G), ecrit(G) donne :
-------------
|804|000|209|
|009|000|100|
|100|302|007|
-------------
|050|104|080|
|000|030|000|
|010|709|020|
-------------
|500|403|008|
|000|000|400|
|406|000|001|
-------------
*//*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.3) Vérifier les contraintes : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Contraintes :
    - Si les valeurs des deux cases sont différentes pas de problèmes.
    - Sinon, si valeurs identiques, on vérifie qu'elles n'appartiennent : - Ni à la même colonne.
                                                                          - Ni à la même ligne.
                                                                          - Ni au même carré.
*/

% carre(L,N) L (donnée) est une liste des coordonnées d'une case, et N est le numéro du carré auquel L appartient

carre([I,J],N) :- Im1 is I - 1, Jm1 is J - 1, N is Im1 // 3 * 3 + Jm1 // 3. 

/* Exemples : 
carre([1,2],N).
N = 0.
carre([8,7],N).
N = 8.
*/

% consistants(Case1,Case2) renvoie vraie si la positons des deux cases (Case1 & Case2 (données)) ne violent pas une des contraintes, faux sinon.

consistants([_,_,N],[_,_,V]) :- N\==V, !. % si la valeur de la case est different on renvoie vrais
consistants([I,J,N],[K,L,N]) :- I\==K, J\==L ,carre([I,J],R1), carre([K,L],R2), R1\==R2. % si non si on a les mêmes valeurs mais que les lignes colones de qu'ils ne sont pas dans le même carré on revoie vrais.

/* Exemples : 
consistants([1,3,5],[1,8,5]).
false.
consistants([1,3,5],[2,1,5]).
false.
consistants([1,3,5],[2,4,5]).
true. */

% teste(Case,LA) renvoie vraie si une affectation de Case (donnée) est compatible avec LA (donné) la liste des affectations.

teste(_,[]) :- !. % cas d'arrêt si la liste des affections est vide on ne teste plus. 
teste([I,J,N],[[K,L,V]|LA]) :- consistants([I,J,N],[K,L,V]), teste([I,J,N],LA). % on test si la cas [I,J] est consistant avec la case [K,L] et on fait l'appel récursif sur le reste de la liste LA.

/* Exemple : 
teste([1,1,5],[[3,2,4],[2,5,4],[1,5,5]]).
false.
teste([1,1,5],[[3,2,4],[2,5,5],[1,5,4]]).
true.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.4 ) Résoudre le problème : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Règle : grille de départ -> quand case = 0 on choisie une valeur entre 1-9,
                            vérifie qu'elle n'entre pas en conflit avec les valeurs déja affectées
                            Si oui le programme essaye une autre valeur (back track)
                            Tips il est nécessaire de mémoriser les valeurs deja affectées dans un paramètre du prédicat recherche de la sol.
*/

% valeur différentes pour la valeur d'une case.
valeur(1).
valeur(2).
valeur(3).
valeur(4).
valeur(5).
valeur(6).
valeur(7).
valeur(8).
valeur(9).

% sol(R,G,L) R est la grille résolut (résultat), G (donnée) est la grille initial et L le liste des valeurs déja affectées qui se remplie au fur et à mesure.
/* Explication du prédicat sol : 
Le cas d'arret de mon prédicat est : si ma grille intiale est vide (on a remplie toutes nos cases) on revois la liste vide pour notre résultat (car récursivité en remontant)
1er cas on cherche dans notre grille initial une case avec comme valeur 0 si oui, on teste en prennent d'autre valeur, si cette dernière (la valeur) ne vient pas violer les contraintes,
si c'est le cas on vient l'ajouter à notre grille résulat, la coupure sert à couper un point de choix et donc à ne pas refaire le teste que la valeur de la case [I,J] soit différent de 0.
Puis on fait l'appelle récursif sur le reste de la grille initial.
Deuxième cas, si dans notre grille initial la case [I,J] a déja un valeur autre que 0 on passe à une autre case en faisant l'appel recursif sur le reste de notre grille initial.  
*/

sol([],[],_). % cas d'arrêt ERREUR 1 boucle
sol([[I,J,V]|G],[[I,J,0]|R],L) :- !,valeur(V), teste([I,J,V],L), sol(G,R,[[I,J,V]|L]).
sol([[I,J,X]|G],[[I,J,X]|R],L) :- sol(G,R,L). 

% resoudre initialise la gille et appelle sol(S,R,V) ou S est la solution du sodoku R notre grille initial et v la liste des taboue initialiser avec les valeurs déja fixée de la grille.
resoudre(S) :- init_grille(R), valeurs_fixees(V) ,sol(S,R,V).
/* Exemple : resoudre(S), ecrit(S).
-------------
|874|651|239|
|239|847|165|
|165|392|847|
-------------
|657|124|983|
|942|538|716|
|318|769|524|
-------------
|521|473|698|
|783|916|452|
|496|285|371|
-------------
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 ) Réflexion sur le programme : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*   
    - Pour résoudre une autre grille de sudoku l'utilisateur à juste à changer les valeurs fixées, il faut bien évidemment que
      ses dernières ne viennent pas à l'encontre des règles du sudoku.

    - Pour changer l'ordre du sudoku (ici 3) il faut changer les paramètres de grille_init(G,X,X), (ici les X)
      ne pas oublié de change l'appelle récursif à l'intérieur du prédicat grille_init : grille_init(G,NLm1,9) -> grille_init(G,NLm1,X). 
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4 ) Amélioration de l'efficacité du programme : %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% grille_init_domaine(G,L,C,D) , idem à grille_init à l'exeption de D (donnée) le domaine dans lequel on peut choisir la valeur de la case en question.

grille_init_domaine([[[1,1,0],D]],1,1,D) :- !.
grille_init_domaine([[[NL,1,0],D]|G],NL,1,D) :- !,NLm1 is NL - 1, grille_init_domaine(G,NLm1,9,D). % cas ou nous somme en fin de ligne (NC = 1) donc on crée une nouvelle ligne en repartant du début (Nc = 9).
grille_init_domaine([[[NL,NC,0],D]|G],NL,NC,D) :- NCm1 is NC - 1, grille_init_domaine(G,NL,NCm1,D). % crée les différentes colonne de 9 à 1.

% grillev2(G) fait appelle à grille_init_domaine avec les bons paramètres ou le dernier est le domaine.

grillev2(G) :- grille_init_domaine(G,9,9,[1,2,3,4,5,6,7,8,9]).

/* Exemple grillev2(G). : 

G = [[[9, 9, 0], [1, 2, 3, 4, 5, 6|...]], [[9, 8, 0], [1, 2, 3, 4, 5|...]], [[9, 7, 0], [1, 2, 3, 4|...]], [[9, 6, 0], [1, 2, 3|...]], [[9, 5, 0], [1, 2|...]], [[9, 4|...], [1|...]], [[9|...], [...|...]], [[...|...]|...], [...|...]|...].
*/

% remplace_v2(L,LVI,R) L liste initial (donné), LVI (donné), et R (résultat). Idem à remplace mais n'oublie pas d'ajouter le domaine D.
% Le premier version de remplace_v2 remplacais ajoutais les valeurs fixées mais avec le domaine, ici le domaine des valeurs fixées est vide.
remplace_v2([],_,[]). 
remplace_v2([[[LL,CL,_],_]|L],LVI,[[[LL,CL,V],[]]|R]) :- member([LL,CL,V],LVI), ! ,remplace_v2(L,LVI,R). % ici la coupure coupe le point de choix et évite de faire un autre member
remplace_v2([[[LL,CL,V],D]|L],LVI,[[[LL,CL,V],D]|R]) :- remplace_v2(L,LVI,R). 

/* init_domaine(L). renvoie la grille sous forme d'une liste (L résultat) avec les différentes cases avec les valeurs fixées 
,les autres initialiser à 0 et le domaine des valeurs possibles pour chaque cases (initialement de 1 à 9 pour un sudoku d'ordre 3). */

init_domaine(S) :- grillev2(G), valeurs_fixees(V), remplace_v2(G,V,R), filtre_fixee(R,S).

/* Exemple init_domaine(R). : 
Version 1 :
R = [[[9, 9, 9], [1, 2, 3, 4, 5, 6|...]], [[9, 8, 0], [1, 2, 3, 4, 5|...]], [[9, 7, 2], [1, 2, 3, 4|...]], [[9, 6, 0], [1, 2, 3|...]], [[9, 5, 0], [1, 2|...]], [[9, 4|...], [1|...]], [[9|...], [...|...]], [[...|...]|...], [...|...]|...].
Version 2 : 
R = [[[9, 9, 9], []], [[9, 8, 0], [1, 2, 3, 4, 5|...]], [[9, 7, 2], []], [[9, 6, 0], [1, 2, 3|...]], [[9, 5, 0], [1, 2|...]], [[9, 4|...], [1|...]], [[9|...], []], [[...|...]|...], [...|...]|...].
*/

% supprime(X,L,R) soit X (donnée) une nombre, L une liste et R le résultat

supprime(_,[],[]). % cas d'arrête si la liste est vide on renvoie la lsite vide 
supprime(X,[X|L],L) :- !. % si l'élement X est identique au début de la liste on renvoie juste le reste (ici la coupure sert à ne pas refaire de teste X == X.
supprime(X,[Y|L],[Y|R]) :- supprime(X,L,R). % si l'éléments X n'est pas identique à Y on fait l'appelle récursif sur le reste de la liste.

/* Exemple  supprime(5,[1,2,3,4,5,6,7,8,9],R).
R = [1, 2, 3, 4, 6, 7, 8, 9]. */

/*Version 1 du filtre(L,N,G,R) L (donné) coordonnées de la case qui entraine le filtre, N (donné) filtre, G (donné) grille à filter, R (résulat).
filtre([_,_],_,[],[]). % cas d'arrêt si La grille intaial est vide on renvoie la liste vide.
filtre([I,J1],X,[[[I,J2,V],D]|G],[[[I,J2,V],ND]|R]) :- J1\==J2, !, supprime(X,D,ND), filtre([I,J1],X,G,R). % cas ou même ligne, on filtre de domaine de la case [I,J2] puis on l'ajoute à la grille et on fait l'appel récursif sur le reste.
filtre([I1,J],X,[[[I2,J,V],D]|G],[[[I2,J,V],ND]|R]) :- I1\==I2, !, supprime(X,D,ND), filtre([I1,J],X,G,R). % cas ou même colonne, même mécanisme que pour les lignes sauf que ici c'est pout la case [I2,J].
filtre([I1,J1],X,[[[I2,J2,V],D]|G],[[[I2,J2,V],ND]|R]) :- carre([I1,J1],R1), carre([I2,J2],R2), R1=:=R2, !, supprime(X,D,ND), filtre([I1,J1],X,G,R). % cas ou même carré, idem que ligne & carré. 
filtre([I1,J1],X,[[[I2,J2,V],D]|G],[[[I2,J2,V],D]|R]) :- filtre([I1,J1],X,G,R). % cas ou la case [I1,J1] ne rentre pas en conflie on recopie juste la case et son domaine qui ne pose pas poblème donc pas de filtrage.

consistants([_,_,N],[_,_,V]) :- N\==V, !. % si la valeur de la case est different on renvoie vrais
consistants([I,J,N],[K,L,N]) :- I\==K, J\==L ,carre([I,J],R1), carre([K,L],R2), R1\==R2. % si non si on a les mêmes valeurs mais que les lignes colones de qu'ils ne sont pas dans le même carré on revoie vrais.

Version 2 du filtre*/
filtre([_,_],_,[],[]) :- !.
filtre([I1,J1],X,[[[I2,J2,V],D]|G],[[[I2,J2,V],ND]|R]) :- not(consistants([I1,J1,_],[I2,J2,V])), !, supprime(X,D,ND), filtre([I1,J1],X,G,R). % cas où la valeur de la case est quelconque mais viole une des contraintes donc on met à jour le domaine. 
filtre([I1,J1],X,[[[I2,J2,V],D]|G],[[[I2,J2,V],ND]|R]) :- not(consistants([I1,J1,0],[I2,J2,V])), !, supprime(X,D,ND), filtre([I1,J1],X,G,R). % cas où la valeur de la case est égale 0, on met à jour le domaine. 
filtre([I1,J1],X,[[[I2,J2,V],D]|G],[[[I2,J2,V],D]|R]) :- consistants([I1,J1,_],[I2,J2,V]), filtre([I1,J1],X,G,R). % cas où il n'y a pas de problème (consistant) on ne met pas le domaine à jour.

% filtre_fixee(GI,R) où GI (donnée) et R (résultat) qui filtre les valeurs fixee de la grille initial permet de gagner en efficaciter
filtre_fixee([],[]) :- !.
filtre_fixee([[[I,J,0],D]|GI],[[[I,J,0],D]|R]) :- !, filtre_fixee(GI,R).
filtre_fixee([[[I,J,V],D]|GI],[[[I,J,V],D]|RES]) :- filtre([I,J],V,GI,R), filtre_fixee(R,RES).

/* Exemple 1) filtre([1,1],1,[[[1,2,0],[1,2,3,4]],[[1,3,0],[1,3,4]],[[2,3,0],[1,2,3]]],L).
L = [[[1, 2, 0], [2, 3, 4]], [[1, 3, 0], [3, 4]], [[2, 3, 0], [2, 3]]]. 

Exemple 2) init_domaine(GI), filtre([9,9],2,GI,R). :
R = [[[9, 9, 9], []], [[9, 8, 0], [1, 2, 3, 4, 5|...]], [[9, 7, 2], []], [[9, 6, 0], [1, 2, 3|...]], 
[[9, 5, 0], [1, 2|...]], [[9, 4|...], [1|...]], [[9|...], []], [[...|...]|...], [...|...]|...].
*/
/* sol_v2(R,GI,Lt) R (résultat) , GI la grille initialisé et Lt la liste des taboues.
1) Cas d'arrêt si la grille initial est vide on renvoie la liste vide pour le resultat.
2) Si on tombe sur une case de notre grille inital avec comme valeur 0, l'appel de member(X,P) permet de choisir une nouvelle valeur
qui appartient au domaine de la case, on teste si cette case avec sa nouvelle valeur ne rentre pas en conflie avec la liste des taboues.
Puis si cette dernière est "validé" on filtre les domaines des autre cases puis, on fait l'appel récursif sur le reste de la grille.
3 ) Cas où on la case de la grille inital à déja une valeurs prise, on passe simplement à la suite (appel récursif sur le reste de la grille),
on n'oublie pas d'ajouter quand même cette case au résultat. 

*/
sol_v2([],[],_). 
sol_v2([[I,J,X]|RES],[[[I,J,0],D]|GI],Lt) :- !, member(X,D), teste([I,J,X],Lt), filtre([I,J],X,GI,R), sol_v2(RES,R,[[I,J,X]|Lt]). % 2)
sol_v2([[I,J,X]|RES],[[[I,J,X],_]|GI],Lt) :- filtre([I,J],X,GI,R) ,sol_v2(RES,R,Lt). % 3)

% resoudre_v2(S) S (résultat) est la grille de sodoku résolu avec les bons appelle, d'abord création de la grille, puis unification de Lt pour avec les valeurs fixés et enfin appel à sol_v2.
% time(resoudre_v2(S)). 406,028 inferences, 0.063 CPU in 0.062 seconds (100% CPU, 6496448 Lips)
resoudre_v2(S) :- init_domaine(GI), valeurs_fixees(Lt), sol_v2(S,GI,Lt).

/* Exemple resoudre_v2(S), ecrit(S). : 
-------------
|874|651|239|
|239|847|165|
|165|392|847|
-------------
|657|124|983|
|942|538|716|
|318|769|524|
-------------
|521|473|698|
|783|916|452|
|496|285|371|
-------------
S = [[9, 9, 9], [9, 8, 3], [9, 7, 2], [9, 6, 1], [9, 5, 5], [9, 4, 6], [9, 3|...], [9|...], [...|...]|...] 

- resoudre(S), time(S). donne :  476,919 inferences, 0.125 CPU in 0.123 seconds (102% CPU, 3815352 Lips)

- resoudre_v2(S), time(S). donne :  832,148 inferences, 0.250 CPU in 0.242 seconds (103% CPU, 3328592 Lips)

*/

