; Andie SAMADOULOUGOU 300 209 487  DEVOIR_3_SCHEME

; Question 1

; c represente la somme des diviseurs propres de x - 1 et est la valeurs que l'on veut tester
; d represente la somme des diviseurs propres de c que l'on va comparer avec x pour determiner
; s'il s'agit bien du nombre que l'on recherche
(define (find-betrothed x) (let ((c (minus1 (sumDivisors x)) ) (d (minus1 (sumDivisors (minus1 (sumDivisors x)))) )) (if (= d x) c (+ d c)) ) )



; Additionne les diviseurs 'Propres' de n 
(define (sumDivisors n)
  (let loop ((i (minus1 n)))
    (cond
      [(= i 1) 1]
      [(= (remainder n i) 0)
       (+ i (loop (minus1 i)))]
      [else (loop (minus1 i))])))
  
; remplacons --i  
(define (minus1 x)(- x 1))

; exemple 
(display (find-betrothed 48))