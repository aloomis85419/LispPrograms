;; Aaron Loomis--CS 3210--Fall 2017
;;==================================
;;enforce-upper-limit function: Compares values in a list with a maxValue and returns a list with values that are greater than the max value replaced by the max value.
;;parameters: 
;;	maxVal - the value to compare to
;;	nums - the list of values passed in
;;	nums2 - the newly constructed list with maxVal enforced
;;assumptions:
;;	1. The limit will be an integer
;;  2. No words will be passed
;;  3. No lists with sublist (currently)
;;Helper Methods
;; 		greaterThanMax: Checks to see if the car of a list is greater than the enforced max. Returns true if so.
;; 		lessThanMax: Checks to see if the car of a list is less than the enforced max. Returns true if so.
;;ALL TESTS PASS

(defun greaterThanMax(value max)
	(> value max))
	
(defun lessThanMax(value max)
	(< value max) )
		
(defun enforce-upper-limit(maxVal lst)
(cond
((null lst)nil)
((greaterThanMax (car lst) maxVal)  (cons maxVal (enforce-upper-limit maxVal (cdr lst))))
((lessThanMax (car lst) maxVal)  (cons (car lst)( enforce-upper-limit maxVal (cdr lst)))))) 

;;Test plan for enforce-upper-limit :
;;_________________________________________________________________________________________________________________________
;;category/description                           data                                              expected output  
;;_________________________________________________________________________________________________________________________
;;regular behavior with numbers                  15 '() '(14 17 18 19)                             (14 15 15 15)   
;;words                                          5 (1 7 3 8 kitty) BAD data                         "Accepts integers only"
;;negative maxVal                                -5 (1 2 3 -6 -7)                                  (-5 -5 -5 -6 -7)
;;singleton list greater than					 4 '(5)												(4)
;;singleton list less than						 4 '(3)												(3)
;;none greater than max							 6 '(1 2 3 4 5)										(1 2 3 4 5)
;;letters                                        5 (c a d d y) BAD                                 "Accepts integers only"
;;empty list                                     5 ()    											NIL