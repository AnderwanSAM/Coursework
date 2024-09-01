; Andie SAMADOULOUGOU 300 209 487  DEVOIR_3_SCHEME

; En lisant cet exercice j'ai compris que 'empty' representait la liste vide => () 
;mais le compilateur ne le reconnaissait pas et mes essais pour le declarer comme variable globale n'ont pas fonctionné
;Je vous prie donc d'utiliser '() au lieu de empty lors du test de ce code. Merci

; While reading this exercice , I understood that empty meant the empty list () but the compiler kept producing an error for it and all my attempts to declare it as  a global variable failed 
; So please use '() instead od empty while testing the code. Thank you 
; 


; the funtion responsible to test the list 
(define (check_order? lst) 
      (cond ((null? lst) "true") 
            ((eq? (length lst) 1) "true"); returning a "true" when the list contains only one element 
      ((> (car (cdr lst)) (car lst)) ; compare the firts elements of the list 
        (check_order? (cdr lst))) ; continue with the rest of the list through recursion
      (else "false")); return "false" when it finds consecutives values not ordered 
     )

(define (increasing-order? lst)( display(check_order? lst)) )
(increasing-order? (cons 3 (cons 7 (cons 9 (cons 19 '())))))
(newline)
(increasing-order? (cons 1 (cons 4 (cons 2 '()))))



