#  Projet en Objective-C avec ajout de code Swift


#### *L'objectif de ce projet est de montrer qu'on peut ajouter des fonctionnalités en Swift sur un projet dont le code de base est en Objective-C.*

La quantité des projets écrit en Objective-C étant conséquente et le nombre de développeurs iOS pratiquant ce langage diminuant deux solutions s'offrent à nous.
- 1) Ré écrire l'ensemble du code de l'application d'Objective-c en Swift. 
- 2) Ajouter du code Swift dans un projet écrit en Objective-C.

__Nous explorons la 2ème option au sein de ce projet__

__Etape 1__
Se rendre dans les targets de votre projet puis *Build Settings* et recherchez __module__, changez à *Yes* :
_Enable Modules (C and Objective-C)_


__Etape 2__
Ensuite, créer un fichier en Swift et nommez-le en utilisant la structure suivante : "{YourProjectName}-Swift".
Une popup devrait apparaître et demander : *Would you like to configure an Objective-C bridging header?* Acceptez.  

__Etape 3__
Ecrire votre fonctionnalité au sein de votre ou vos fichier(s) *swift*
Vous remarquez que ces derniers ne seront pas reconnus au sein des fichiers Objective-c (.h et .m) car vos classes et autres éléments nécessitent un ajout de *@objc* avant leur déclaration ainsi que l'ajout de l'import au sein de votre fichier .m : ```swift #import "ProjectObjectiveC-Swift.h"```.
Voir ProjectObjectiveC-Swift.swift pour plus de détails.

*Auteur : Lilian Alvarez.*
*Sources utilisées, formation Objective-c par Paul Hudson*.

