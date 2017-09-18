;;Aaron Loomis - CS3210 - Fall 2017
;;=================================
;;fizzbuzz function: Calculates  whether a number is evenly divisible by 3, 5, and 3 & 5. The output is one long list of numbers 1-20 containing sublists with those numbers eveny divisible by 3 or 5 or (3&5).
;;The function then creates sublists for the 3 possibilities:
;;1. Number is divisible by 3: Insert into a sublist containing the number followed by the word "fizz"
;;2. Number is divisible by 5: Insert into a sublist containing the number followed by the word "buzz"
;;3. Number is divisible by 3 & 5: Insert into a sublist containing the number followed by the word 
;;   "fizzbuzz"
;; parameters:
;;    lst - a list of numbers;;
;; assumptions for fizzbuzz : 
;;    1. No nested lists are passed in
;;    2. All list elements are integers 
;;    3. no duplicates
;; Helper functions izFizz, isBuzz, isFizzBuzz are boolean functions that determine if a number is divisible by 3 or 5. 
;; 		print: provides a way to insert sublists into another list with a message for those values which are divisible by 3 or 5. (3 fizz) (5 buzz) (3&5 fizzbuzz)
;;REVISE AND IMPROVE

(defun is-fizz(num)
  (= (mod num 3) 0))

(defun is-buzz (num)
  (= (mod num 5) 0))

(defun is-fizz-buzz(num)
  (and (is-fizz num) (is-buzz num)))
  		
(defun fizzbuzz(lst)
(cond 
((null lst)nil)
((is-fizz-buzz (car lst)) (cons (append (list (car lst)) '(fizzbuzz)) (fizzbuzz (cdr lst))))
((is-fizz (car lst)) (cons (append (list (car lst)) '(fizz)) (fizzbuzz (cdr lst))))
((is-buzz (car lst)) (cons (append (list (car lst)) '(buzz)) (fizzbuzz  (cdr lst))))
(t      (cons (car lst)(fizzbuzz(cdr lst))))))
		
;; Test plan for fizzbuzz:
;; category/description            data                                                 expected result
;;________________________________________________________________________________________________________________________________________________________________________________
;; empty list                      ()                                                   () 
;; list with 1 element             (6)                                                  ((6 fizz))
;; list with 1 element             (7)                                                  ()
;; list with 1 element             (5)                                                  ((5 buzz))
;; list with 1 element             (15)                                                 ((15 fizzbuzz))
;; list with multiple elements     (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)                (1 2 (3 fizz) 4 (5 buzz) (6 fizz) 7 8 (9 fizz) (10 buzz) 11 (12 fizz) 13 14 (15 fizzbuzz))
;;_________________________________________________________________________________________________________________________________________________________________________________
                                                                      

	

