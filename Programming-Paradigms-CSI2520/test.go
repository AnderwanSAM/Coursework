package main

import (
	"fmt"
	"time"
   "runtime"
   "sync"
   "bufio"
    //"log"
    "os"
  "strconv"
	//"knapsackRec"
)



/* A brute force recursive implementation of 0-1 Knapsack problem 
modified from: https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10 */

func Max(x, y int) int {
    if x < y {
        return y
    }
    return x
}

// Returns the maximum value that 
// can be put in a knapsack of capacity W 
func KnapSack(W int, wt []int, val []int ) int { 

	// Base Case 
	if (len(wt) == 0 || W == 0) {
		return 0 
	}
	last := len(wt)-1

	// If weight of the nth item is more 
	// than Knapsack capacity W, then 
	// this item cannot be included 
	// in the optimal solution 
	if wt[last] > W { 
	
		return KnapSack(W, wt[:last], val[:last])	 

	// Return the maximum of two cases: 
	// (1) nth item included 
	// (2) item not included 
	} else {
		
		return Max(val[last] + KnapSack(W - wt[last], wt[:last], val[:last]), KnapSack(W, wt[:last], val[:last]))
	}
} 


func main() {

    //obtenir le nom du fichier 
	fmt.Println("Veuiller entrez le nom du fichier d'entree : ")
    var file string
    fmt.Scanln(&file) 

    //variables
     var names []string
     var weights []int
     var values[] int 
    var data [] string // pour garder les infos contenus dans le fichier 
    //var trace[] int //pour garder les  indices des objets ajoutes dans

    //obtenir les informations contenues dans le fichier () // mettre dans une fonction
     f, err := os.Open(file)
    if err != nil {
        fmt.Println(err)
     }

    defer f.Close()

    scanner := bufio.NewScanner(f)
    scanner.Split(bufio.ScanWords)
    
  
    
    for scanner.Scan() {
        jeton := scanner.Text()
        data = append(data,jeton)
       
    }
    
    //recuperer le nombre d'items 
    N, err := strconv.Atoi(data[0]) //lire le nombre d'items
    //fmt.Println(N)
    W,err := strconv.Atoi(data[len(data)-1])
    //recuperer les noms 
    indexN := 1
    for j := 0 ; j < N ; j++{

        names = append(names,data[indexN])
        indexN += 3
    }
    //recuperer les valeurs 
    indexV := 2
    for j := 0; j< N ; j++{
        t, err := strconv.Atoi(data[indexV])
        values = append(values,t)
        indexV += 3
        if err != nil {
            fmt.Println(err)
        }
    }
    //recuper les poids 
    indexP :=  3
    for j := 0 ; j<N ; j++{
        t, err := strconv.Atoi(data[indexP])
        weights = append(weights,t)
        indexP += 3
        if err != nil {
            fmt.Println(err)
        }
        
    }

   // fmt.Println(names)
   // fmt.Println(values)
   // fmt.Println(weights)

    if err := scanner.Err(); err != nil {
        fmt.Println(err)
    }


    fmt.Println("Number of cores: ",runtime.NumCPU())
	
	// simple example
	//W:= 85//7
	//weights := []int{10, 20,7, 30,3,25}  // {1,2,3,5}
	//values := []int{60, 100,500, 120,100,10}               // {1,6,10,15}
	
	start := time.Now();
	var wg sync.WaitGroup
	wg.Add(2)
	last := len(weights)-1 
	r1 := 0 
	r2 := 0
    // best solution with the last item
    go func(W int, wt []int, val []int , wg *sync.WaitGroup) {
    	  //fmt.Println("1")
    	  r1 = KnapSack(W, wt, val)

          //fmt.Println(r1)
          wg.Done()

    }(W - weights [last], weights [:last], values [:last],&wg) 
    // best solution without the last item
    go func (W int, wt []int, val []int , wg *sync.WaitGroup){
    	    // fmt.Println("2")
    	     r2  = KnapSack(W, wt, val)
            //fmt.Println(r2)
            wg.Done()

    }(W, weights, values, &wg) 
  // go KnapSack(W, weights [:last], values [:last], &wg)
   // code here to synchronize and then determine which one is the best solution
       
    
	wg.Wait()
	fmt.Println("r1") 
	fmt.Println(r1)
	fmt.Println("r2")
	fmt.Println(r2)

	end := time.Now();
    fmt.Printf("Total runtime: %s\n", end.Sub(start))
}
