
; Andie SAMADOULOUGOU 300 209 487  Q3_D3_SCHEME 
;

; J'ai remarqué que les rétroactions sur mes devoirs  etaient en anglais. J'ai donc cette fois  redigé les commentaires dans cette langue. 
; Je m'excuse si vous etes francophone. 

; testing if it is a vowel 
(define (isVowel? ch) 
      (cond ((null? (char->integer ch)) 0)  
      ( (= (char->integer ch) 65) 1 ) 
      ( (= (char->integer ch) 97) 1  ) 
      ( (= (char->integer ch) 101) 1  ) 
      ( (= (char->integer ch) 69) 1  ) 
      ( (= (char->integer ch) 105) 1  ) 
      ( (= (char->integer ch) 117) 1  ) 
      ( (= (char->integer ch) 73) 1  ) 
      ( (= (char->integer ch) 111) 1  ) 
      ( (= (char->integer ch) 79) 1  ) 
      ( (= (char->integer ch) 89) 1  ) 
      ( (= (char->integer ch) 85) 1  ) 
      ( (= (char->integer ch) 121) 1  ) 
      (else 0))
     )

; converting the string into a list 
(define (get_list str)(string->list str) )

; once filtered , we will need to convert it back to a string 
(define (get_string lst )(list->string  lst))


; let's define get vowel, 
; The process is the following 
; Get the String , turn it into a list , cvlean the list by removing consouns and turn the list back to a string and return it 
(define (get-vowels-sc str) (display   (get_string ( filter ( lambda (x) (= (isVowel? x) 1 ) )  (get_list str)   )    ) ) )

;(get-vowels-sc "A big hello world!")

(display (get_string '(#\A #\B)   ))
(newline)
(get-vowels-sc "Andie")
(newline)
(get-vowels-sc "A big hello world!")

;(display (filter (lambda (x) (= (isVowel? x)  1)) '(#\A #\B)))
