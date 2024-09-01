package projetCSI2510_300209487;
 /*
  * Andie Erwan Kiswendsida SAMADOULOUGOU 
  * 300209487
  * 
  * */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Scanner;
import java.util.Stack;


//import projectCSI2510_300209487.GaleShapley;

public class GaleShapley {
	
	GaleShapley(){};
	
	static  public int n ;
	static Stack <Employeur> Sue = new Stack<Employeur>(); 
	static  List <String> nom_des_Etudiants = new ArrayList<String>();
	static List <String> nom_des_entreprises = new ArrayList<String>();
	static int students[]; static int employers[];
	static CustomPriorityQueue [] PQ ; // = new CustomPriorityQueue[n];
	static int [][] A ; //= new int [n][n];
	static public String nom_de_fichier = "matches_";
	
	public static void Initialize( String file_name) 
	{
		//Utiliser le nom obtenu en parametres pour former le nom du fichier de sortie 
		nom_de_fichier += file_name;
		// Tirer toutes les informations possibles du fichier texte 
		BufferedReader lecteur;
		try {
			lecteur = new BufferedReader(new FileReader(file_name));
			//lire la premiere ligne correspondant au nombre n et le convertir en int 
			String line = lecteur.readLine();
			String nombre = line;
			n = Integer.parseInt(nombre);	
			int [][]employeurs_rankings = new int [n][n];
			int [][]students_rankings = new int [n][n];
			
			//Empiler les employeur 
			
			for (int i = 0 ; i < n ;i++) 
			{ 
				Employeur e_temporaire = new Employeur(i,lecteur.readLine());//creer un employeur temporaire
				Sue.add(e_temporaire);//Empiler cet employeur /
			}
			 // mettre les noms des employeurs dans une liste pour la realisation du rapport des  appariement
			for (int i =0 ; i < n ; i++) 
			{
				nom_des_entreprises.add(Sue.get(i).name);
			}
			
			//Lire les Etudiants et leurs noms 
			for (int i =0 ; i<n ; i++) 
			{
				nom_des_Etudiants.add(lecteur.readLine());
			}
			
			//lire  les elements de la matrice, les separer et les stocker 
			// la matrice est carree, par consequent , son nombre de ligne est de n
			String [] fragments = new String[n];
			//String [] elements_de_matrice = new String[n];
			for (int i = 0 ; i < n; i++) 
			{
				line = lecteur.readLine();//lire la ligne 
				//la diviser en fonction des espaces 
				String jeton = line; 
				fragments = jeton.split(" ",n);
				//test fragments 
				//diviser les jetons obtenus en fonction des virgules
				for(int j =0 ; j < n ; j++) 
				{
					String et [] = new String[2];
					et = fragments[j].split(",",2);
					employeurs_rankings[i][j] = Integer.parseInt(et[0]);
					students_rankings[i][j] = Integer.parseInt(et[1]);
					
				}
			} 
			
			// Rendu ici, toutes les informations ont ete extraites , appliquons la suite de l'initialisation
			
			int []studentsI = new int [n]; int []employersI = new int [n];
			for(int i =0 ; i < n ; i++) { studentsI[i] = employersI[i] = -1;  }// intitialisation des tableaux � -1
			students = studentsI;
			employers = employersI;
			A = students_rankings;
			
			CustomPriorityQueue[] PQ1 = new CustomPriorityQueue [n] ; 
			for (int i =0 ; i< n ; i++) 
			{
				PQ1[i] = new CustomPriorityQueue();
			}
			for (int s = 0; s < n ; s++) 
			{
				for(int e = 0 ; e < n ; e++) 
				{
					PQ1[e].insert(employeurs_rankings[e][s],s);
				}
			}
			
			PQ = PQ1;
			lecteur.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
   public static int[] Execute() // implementation de l'algorithme 
   {
	   int e , e1,s;
	   while( !Sue.empty()) 
	   {
		   e = Sue.pop().index;
		   s = PQ[e].removeMin().getValue();
		   e1 = students[s];
		   if( students[s] == - 1) 
		   {
			   students[s] = e;
			   employers[e] = s;
		   }
		   else if ( A[s][e] < A [s][e1]) 
		   {
			   students[s] = e; 
			   employers[e]= s;
			   employers[e1] = -1 ; 
			   Employeur x = new Employeur(e1,"ReferToTable");
			   Sue.push(x);
		   }
		   else 
		   {
			   Employeur y = new Employeur(e,"ReferToTable");
			   Sue.push(y);
		   }
		   
	   }
	   
	   
	   
	   
	   return employers ;
   }
	
   public static void save() 
   {
	   try {
		PrintWriter writer = new PrintWriter(nom_de_fichier);
		for (int i = 0 ; i < n ; i++) 
		{
			writer.println("match " + i + " : " + nom_des_entreprises.get(i) + " - " + nom_des_Etudiants.get(employers[i]));
		}
		
		writer.close();
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
   }
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String input_file_name;
		
		System.out.println("Veuillez entrer le nom du fichier d'entree : ");
		input_file_name = in.nextLine();
		
		GaleShapley a = new GaleShapley();
		a.Initialize(input_file_name);
		int results [] = a.Execute();
		a.save();
		
		
	}
	
	

}

