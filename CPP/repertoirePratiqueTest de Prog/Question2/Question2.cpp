#include <iostream>
using namespace std;

/*

Quelques fonctions utilitaires.
================================

Vous pouvez les emprunter pour faire vos devoirs.

Vous remarquerez la pr�sence de commentaires. Ceux-ci expliquent ce
que fait la fonction (la t�che � accomplir) et non pas le code.

*/

// �changer le contenu de deux variables.
void echanger(long &A, long &B)
{
	long C = A;
	A = B;
	B = C;
	/*
	Ces trois affectations forment ce qu'on appelle une circulation ou rotation.
	Si on "voit" les trois transferts d'un seul coup, on voit un cycle.
	(cycle == cercle ==> circuler, tourner en rond.)
	C <--  A <-
	\        /
	\      /
	\    /
	-> B

	Note : L'�diteur de Visual Studio n'est pas un bon �diteur graphique. D�sol�.
	*/
}
/*
Exemple d'un mauvais commentaire pour d�crire la t�che de la fonction echanger().
=======

C est affect� le contenu de A. Puis, A est affect� le contenu de B.
Enfin, B est affect� le contenu de C.

Ce commentaire est d'une inutilit� flagrante. Si vous savez lire du C++, vous
aurez compris qu'on a juste "lu" les trois instructions. Ce que le lecteur
veut savoir c'est : qu'est-ce que �a fait ? Quelle est la t�che accomplie ?
Quel est l'effet d'appeler cette fonction ? Quel est le r�sultat final ?

*/


// G�n�rer un nombre � l'int�rieur d'un intervalle donn�.
long genererNombre(long plusPetiteValeur, long plusGrandeValeur)
{
	// La valeur retourn�e sera dans l'intervalle [plusPetiteValeur, plusGrandeValeur].

	return plusPetiteValeur + rand() % (plusGrandeValeur - plusPetiteValeur + 1);
	/*
	Explication de la t�che :
	(plusGrandeValeur-plusPetiteValeur+1) est la largeur de l'intervalle des nombres d�sir�s.

	rand() % (plusGrandeValeur-plusPetiteValeur+1) produit des nombres dans
	l'intervalle [ 0, (plusGrandeValeur-plusPetiteValeur) ].
	(Avez-vous not� la disparition du "+1" ? )

	L'expression plusPetiteValeur + rand() % (plusGrandeValeur-plusPetiteValeur+1)
	produit des r�sultats dans l'intervalle
	[ plusPetiteValeur + 0 , plusPetiteValeur + (plusGrandeValeur-plusPetiteValeur) ]
	c'est-�-dire dans l'intervalle
	[ plusPetiteValeur, plusGrandeValeur ].

	*/
}

// Remplir un intervalle du tableau avec des donn�es en ordre croissant.
void genereDonneesEnOrdre(long T[], long debut, long fin,
	long valeurInitiale,
	long plusPetiteDifference, long plusGrandeDifference)
{
	T[debut] = valeurInitiale;
	for (long K = debut + 1; K <= fin; K++)
		T[K] = T[K - 1] + genererNombre(plusPetiteDifference, plusGrandeDifference);

	/*
	* debut et fin sont les bornes de l'intervalle � remplir.
	* valeurInitiale sera la premi�re valeur, celle � mettre dans T[debut].
	* plusPetiteDifference sera la plus petite diff�rence entre une valeur et
	la suivante dans l'intervalle, i.e. (T[K] - T[K-1]) >= plusPetiteDifference.
	* plusGrandeDifference sera la plus grande diff�rence entre une valeur et
	la suivante dans l'intervalle, i.e. (T[K] - T[K-1]) <= plusGrandeDifference.
	Donc, plusPetiteDifference <= (T[K] - T[K-1]) <= plusGrandeDifference
	pour tous les K tel que debut < K <= fin. (Voir genererNombre().)

	Note #1 : Si plusPetiteDifference == 0, vous permettez des doublons.

	Note #2 : Si plusPetiteDifference == 1, vous permettez qu'il n'y ait
	pas de "trous" entre certaines valeurs cons�cutives.
	Note #3 : Si plusPetiteDifference >= 2, alors on garantit qu'il y
	aura des "trous" entre chaque paire de valeurs cons�cutives.
	Note #4 : Si plusPetiteDifference == plusGrandeDifference, alors
	les valeurs cons�cutives seront toutes � distance constante
	plusPetiteDifference.
	Note #5 : Si 0 == plusPetiteDifference == plusGrandeDifference, alors
	les valeurs seront toutes les m�mes.
	*/
}

// Brasser le contenu d'un intervalle.
void brasserTableau(long T[], long debut, long fin)
{
	for (long K = debut; K < fin; K++)
		echanger(T[K], T[genererNombre(K, fin)]);
	/*
	"brasser" est pris dans le sens de "brasser un paquet de cartes". Il n'y a
	pas de pertes ou d'ajouts d'information, seulement un changement d'ordre.
	La strat�gie : On balaie l'intervalle de d�but jusqu'� fin-1. Pour chaque
	�l�ment en position K visit�, on l'�change avec un �l�ment dans l'intervalle
	[K, fin] choisi au hasard. (Voir genererNombre().)
	Notez qu'il est possible qu'un �l�ment soit �chang� avec lui-m�me. Ceci est
	similaire � ce qui pourrait se passer avec un paquet de cartes. Supposez que
	l'as de pique soit sur le dessus du paquet. Vous brassez. Surprise : l'as de
	pique est encore sur le dessus du paquet. C'est possible mais peu probable
	(une chance sur 52 pour un paquet complet de cartes.)
	*/
}

// Afficher le contenu d'un intervalle d'un tableau.
void afficherTableau(long T[], long debut, long fin)
{
	long compteur = 1;
	for (long K = debut; K <= fin; K++)
	{
		cout << T[K];
		if (compteur % 10 == 0)
			cout << endl;
		else
			cout << "\t";
		compteur++;
	}
}

// V�rifier si un intervalle est en ordre croissant
bool estEnOrdreCroissant(long T[], long debut, long fin)
{
	for (long K = debut; K < fin; K++)
		if (T[K] > T[K + 1])
			return false;
	return true;
	/*
	Une seule paire de valeurs successives en d�sordre suffit pour
	dire que ce n'est pas en ordre croissant.
	*/
}

// V�rifier si un intervalle est en ordre croissant stricte.
bool estEnOrdreCroissantStricte(long T[], long debut, long fin)
{
	for (long K = debut; K < fin; K++)
		if (T[K] >= T[K + 1])
			return false;
	return true;
	/*
	Une seule paire de valeurs successives en d�sordre ou un seul doublon
	suffit pour dire que ce n'est pas en ordre croissant stricte.
	*/
}

// V�rifier si un intervalle est en ordre croissant avec "trous".
bool estEnOrdreCroissantAvecTrous(long T[], long debut, long fin)
{
	for (long K = debut; K < fin; K++)
		if ((T[K + 1] - T[K]) < 2)
			return false;
	return true;
	/*
	Une seule paire de valeurs successives en d�sordre (diff�rence n�gative)
	ou un seul doublon (diff�rence nulle)
	ou une seule paire de valeurs successives avec une diff�rence de 1
	suffit pour dire que ce n'est pas en ordre croissant avec "trous".
	*/
}

// Afficher une ligne de ==== de longueur choisie.
void afficherLigneSeparation(long N)
{
	for (long K = 0; K < N; K++)
		cout << "=";
	cout << endl;
}

bool sontEgauxDeuxTableaux(long T1[], long T2[], long Debut, long Fin)
{
	// Hypoth�se : les deux intervalles ont les m�mes �l�ments dans le m�me ordre.

	// V�rifions l'hypoth�se.
	for (long K = Debut; K <= Fin; K++)
		if (T1[K] != T2[K])
			return false; // L'hypoth�se est fausse. Il suffir d'une seule diff�rence pour que ce ne soit pas �gal.
	return true; // L'hypoth�se est vraie.
}

/*
TriPartielBubble( T[], Debut, Fin )
	pour K = Debut jusqu�� (Fin-1)
		si( T[K] > T[K+1] )
			echanger( T[K], T[K+1] )
*/

void TriPartielBulles(long T[], long Debut, long Fin)
{
	/*
	Vous pouvez choisir le "bon bug" en enlevant les // devant l'un des cinq for
	suivants tout en gardant un seul des for sans le // au d�but.
	*/
//	for( long  K = Debut-1 ; K < Fin   ; K++ )		// Version avec erreur : commence trop t�t
//  for( long  K = Debut+1 ; K < Fin   ; K++ )		// Version avec erreur : commence trop tard
//	for( long  K = Debut   ; K < Fin-1 ; K++ )		// Version avec erreur : finit trop t�t
//	for( long  K = Debut   ; K <= Fin  ; K++ )		// Version avec erreur : finit trop tard
	for (long K = Debut; K < Fin; K++)  // Version correcte
		if (T[K] > T[K + 1])
			echanger(T[K], T[K + 1]);
}


int main()
{
	/*
	Votre travail : �CRIRE des tests qui permettraient de d�tecter
	des erreurs par un sur le contr�le de l'intervalle de travail :
	- d�tecter si le contr�le commence trop t�t
	- d�tecter si le contr�le commence trop tard
	- d�tecter si le contr�le finit trop t�t
	- d�tecter si le contr�le finit trop tard

	Note : La question n'est pas pour vous de trouver les erreurs dans
	le code	mais pour vous de d�montrer que vous pouvez �crire des
	tests qui, eux, vont montrer s'il y a une ou des erreurs.
	*/

	/*
	Commentaires g�n�raux :
	Comme la v�rification utilise une compraison d'intervalle � intervalle, 
	le fait que l'on d�tecte une diff�rence ne veut pas dire que l'origine 
	de l'erreur soit n�cessairement celle que le test devait d�tecter. 
	Toutefois, le fait que l'on d�tecte une diff�rence est indicatif de la 
	pr�sence d'une erreur. Le fait de savoir qu'il y a une erreur est d�j� 
	un pas dans la bonne direction. Il faudra faire preuve de t�nacit� pour 
	trouver l'erreur.

	Les tests suivants sont sp�cifiques � tester le contr�le de l'intervalle 
	de travail. Il n'est pas impossible que s'il y a erreur, elle pourrait 
	provenir d'une autre source.

	Rappel : Le but du testing n'est pas de prouver qu'il n'y a pas d'erreur,
	le but du testing est de trouver des erreurs.
	Le fait qu'on n'en trouve pas pourrait n'�tre qu'une indication de notre 
	manque d'imagination.

	*/

	long debut, fin;
	long indice[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

	cout << endl << "=========================================================================" << endl;


	//	Test #1 - d�tecter si le controle commence trop t�t

	cout << endl << "Test #1 - detecter si le controle commence trop tot" << endl << endl;

	debut = 3;
	fin = 7;
	/*
	Proposez un test qui va permettre la d�tection que le contr�le 
	de l'intervalle commence trop t�t.
	*/
	//                   #0  1  2  3  4  5  6  7  8  9
	long Tableau1[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Original - sera modifi� par l'appel � la fonction TriPartielBulles).
	long Attendu1[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Attendu (apr�s l'appel � la fonction TriPartielBulles si le tri fonctionne bien).

	TriPartielBulles(Tableau1, debut, fin);
	if (!sontEgauxDeuxTableaux(Tableau1, Attendu1, debut, fin))
	{
		cout << "Test #1 positif - difference detectee - controle commence trop tot ?" << endl;
		cout << "indice" << endl;
		afficherTableau(indice, 0, 9);
		cout << "Attendu" << endl;
		afficherTableau(Attendu1, 0, 9);
		cout << "Obtenu" << endl;
		afficherTableau(Tableau1, 0, 9);
	}
	else
		cout << "Test #1 negatif - aucune difference detectee." << endl;
	cout << endl << "=========================================================================" << endl;


	// 	Test #2 - d�tecter si le contr�le commence trop tard

	cout << endl << "Test #2 - detecter si le controle commence trop tard." << endl << endl;


	debut = 3;
	fin = 7;
	/*
	Proposez un test qui va permettre la d�tection que le contr�le
	de l'intervalle commence trop tard.
	*/
	//                   #0  1  2  3  4  5  6  7  8  9
	long Tableau2[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Original - sera modifi� par l'appel � la fonction TriPartielBulles).
	long Attendu2[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Attendu (apr�s l'appel � la fonction TriPartielBulles si le tri fonctionne bien).

	TriPartielBulles(Tableau2, debut, fin);
	if (!sontEgauxDeuxTableaux(Tableau2, Attendu2, debut, fin))
	{
		cout << "Test #2 positif - difference detectee - controle commence trop tard ?" << endl;
		cout << "indice" << endl;
		afficherTableau(indice, 0, 9);
		cout << "Attendu" << endl;
		afficherTableau(Attendu2, 0, 9);
		cout << "Obtenu" << endl;
		afficherTableau(Tableau2, 0, 9);
	}
	else
		cout << "Test #2 negatif - aucune difference detectee." << endl;
	cout << endl << "=========================================================================" << endl;


	// Test #3 - d�tecter si le contr�le finit trop t�t

	cout << endl << "Test #3 - detecter si le controle finit trop tot." << endl << endl;


	debut = 3;
	fin = 7;
	/*
	Proposez un test qui va permettre la d�tection que le contr�le
	de l'intervalle finit trop t�t.
	*/
	//                   #0  1  2  3  4  5  6  7  8  9
	long Tableau3[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Original - sera modifi� par l'appel � la fonction TriPartielBulles).
	long Attendu3[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Attendu (apr�s l'appel � la fonction TriPartielBulles si le tri fonctionne bien).

	TriPartielBulles(Tableau3, debut, fin);
	if (!sontEgauxDeuxTableaux(Tableau3, Attendu3, debut, fin))
	{
		cout << "Test #3 positif - difference detectee - controle finit trop tot ?" << endl;
		cout << "indice" << endl;
		afficherTableau(indice, 0, 9);
		cout << "Attendu" << endl;
		afficherTableau(Attendu3, 0, 9);
		cout << "Obtenu" << endl;
		afficherTableau(Tableau3, 0, 9);
	}
	else
		cout << "Test #3 negatif - aucune difference detectee." << endl;
	cout << endl << "=========================================================================" << endl;


	// Test #4 - d�tecter si le contr�le finit trop tard

	cout << endl << "Test #4 - detecter si le controle finit trop tard." << endl << endl;

	debut = 3;
	fin = 7;
	/*
	Proposez un test qui va permettre la d�tection que le contr�le
	de l'intervalle commence trop tard.
	*/
	//                   #0  1  2  3  4  5  6  7  8  9
	long Tableau4[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Original - sera modifi� par l'appel � la fonction TriPartielBulles).
	long Attendu4[10] = { 7, 7, 7, 7, 7 ,7, 7, 7, 7, 7 }; // Attendu (apr�s l'appel � la fonction TriPartielBulles si le tri fonctionne bien).

	TriPartielBulles(Tableau4, debut, fin);
	if (!sontEgauxDeuxTableaux(Tableau4, Attendu4, debut, fin))
	{
		cout << "Test #4 positif - difference detectee - controle finit trop tard ?" << endl;
		cout << "indice" << endl;
		afficherTableau(indice, 0, 9);
		cout << "Attendu" << endl;
		afficherTableau(Attendu4, 0, 9);
		cout << "Obtenu" << endl;
		afficherTableau(Tableau4, 0, 9);
	}
	else
		cout << "Test #4 negatif - aucune difference detectee." << endl;
	cout << endl << "=========================================================================" << endl;




	return 0;
}