package main

import "fmt"
import "time"
import "runtime"
import "sync"


/*
Andie SAMADOULOUGOU 300209487 CSI 2520

Note : 
La fonction Knapsack a ete modifie. Elle declenche des go routines lorsqu'elle doit attendre des resultats pour comparaison 
Cela permet de respecter le paradigme concurrent


*/


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
func KnapSack(W int, wt []int, val []int, result *int, wg *sync.WaitGroup, N int ) int { 

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
		return KnapSack(W, wt[:last], val[:last],result , wg,N)	 

	// Return the maximum of two cases: 
	// (1) nth item included 
	// (2) item not included 
	} else {
		// il est possible d'ajouter le dernier element 
		//place au choix 
		if (len(wt) == (N/2)  ){ //approche recursive car peu d'elements  
			//Pourquoi 2 ? le temps d'execution est sensiblement le meme lorsque l'on arrete la programmation concurrentielle 
			max := Max(val[last] + KnapSack(W - wt[last], wt[:last], val[:last],result,wg,N), KnapSack(W, wt[:last], val[:last],result,wg,N))
			*result = max 
			wg.Done()
			return max

		} else {
		left := 0 
		right := 0
		var wg1 sync.WaitGroup 
		wg1.Add(2)
		go func(W int, wt []int, val []int, result *int, wg *sync.WaitGroup,value int , N int){
			left = value + KnapSack(W , wt, val,result,wg,N)

		}(W - wt[last], wt[:last], val[:last],result,&wg1,val[last],N)
		go func(W int, wt []int, val []int, result *int, wg *sync.WaitGroup, N int  ){
			right = KnapSack(W , wt, val,result,wg,N)

		}(W, wt[:last], val[:last],result,&wg1,N)
       
       wg1.Wait()
        max := Max(left,right)

		//max := Max(val[last] + KnapSack(W - wt[last], wt[:last], val[:last]), KnapSack(W, wt[:last], val[:last]))
		*result = max 
		wg.Done()
		return max

		}
		
	}

} 

// Driver code 
func main()  { 

    fmt.Println("Number of cores: ",runtime.NumCPU())
	
	// simple example
	W:= 7
	weights := []int{1,2,3,5}
	values := []int{1,6,10,15}
	ok1 := 0
	ok2 := 0 
	start := time.Now();
	N := 4
	//fmt.Println(KnapSack(W, weights , values))
    var wg sync.WaitGroup
    wg.Add(2)
    last := len(weights)-1
    // best solution with the last item
    go KnapSack(W - weights [last], weights [:last], values [:last],&ok1,&wg,N)
   // best solution without the last item
    go KnapSack(W, weights [:last], values [:last],&ok2,&wg,N)
    
    wg.Wait()

    if(ok2>ok1){
    	fmt.Println(ok2)
    } else{
    	fmt.Println(ok1)
    }


	end := time.Now();
    fmt.Printf("Total runtime: %s\n", end.Sub(start))	

} 
