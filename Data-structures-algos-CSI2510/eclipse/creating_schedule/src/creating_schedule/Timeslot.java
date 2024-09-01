package creating_schedule;

import java.util.Scanner;



public class Timeslot {
String Jour;
String heure_debut;
String heure_fin;
Timeslot(String Jour , String heure_debut, String heure_fin )
{
this.Jour = Jour;
this.heure_debut = heure_debut;
this.heure_fin= heure_fin;
}


Timeslot()
{
}
public String getJour() 
{
return this.Jour;	
}
public String getHeureDebut() 
{
	return this.heure_debut;
}
public String getHeureFin() 
{
	return this.heure_fin;
}

public boolean estEnConflit(Timeslot a)
{
	
	//les cas de conflits possibles sont : 
	
	//meme timeslot 
	if (this.Jour.equalsIgnoreCase(a.getJour())&&this.heure_debut.equalsIgnoreCase(a.getHeureDebut())&&this.heure_fin.equalsIgnoreCase(a.getHeureFin()) ) 
	{
		return true; //il y a un conflit 
	}
	
	//transformer pour avoir les valeurs en int pour la comparaison
	/*String tabExterneD[] = a.getHeureDebut().split("H");
	String tabExterneF[] = a.getHeureFin().split("H");
	String[] tabInterneD = this.heure_debut.split("H");
	String [] tabInterneF = this.heure_fin.split("H");
	Int debut */
	// on suppose que tout est coll�
	
	if (this.Jour.equalsIgnoreCase(a.getJour())) 
	{
		int debut_current = Integer.parseInt(this.heure_debut);
		int fin_current = Integer.parseInt(this.heure_fin);
		int debut_autre = Integer.parseInt(a.getHeureDebut());
		int fin_autre = Integer.parseInt(a.getHeureFin());
		//timeslot superpos�s 1 durant l'autre 
		if(debut_current<fin_autre && debut_current>debut_autre)// ce cours commence pendant l'autre
		{
			return true ;
		}
		if (fin_current > debut_autre && fin_current < fin_autre) 
		{
			return true ;
		}
		if (debut_autre>debut_current && debut_autre < fin_current) 
		{
			return true ;
		}
		if( fin_autre > debut_current && fin_autre < fin_current) 
		{
			return true ;
		}
		
		
	}
	return false;
	
}

/*public static void main(String[] args) {
	Timeslot a = new Timeslot("Lundi","1300","1500");
	Timeslot b = new Timeslot("Lundi","1330","1530");
	System.out.println(a.estEnConflit(b));
	
}*/

}
