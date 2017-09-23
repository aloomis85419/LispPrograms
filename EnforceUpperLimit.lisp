;; Aaron Loomis--CS 3210--Fall 2017
;;==================================
;;enforce-upper-limit function: Compares values in a list with a maxValue and returns a list with values that are greater than the max value replaced by the max value.
;;parameters: 
;;	maxVal - the value to compare to
;;	lst - list of arbitrary numeric values
;;assumptions:
;;	1. The limit will be an integer.
;;  2. No words will be passed.
;;  3. If the list contains any sublists then they are of depth = 1.
;;Helper Methods
;;greaterThanMax: Checks to see if the car of a list is greater than the enforced max. Returns true if so.
;;lessThanMax: Checks to see if the car of a list is less than the enforced max. Returns true if so.
;;enforce-upper-limit-sublist - enforces the upper limit on the sublists as well.
;;Assumptions: Same as enforce-upper-limit.
;;Parameters:
;;	limit - the value to be enforced on the sublist. A value in the list will be changed to the value of limit if greater than the limit.
;;	sblst - a sublist out of the original list containing arbitrary numerical values.
;;ALL TESTS PASS
;;NEEDS TESTING FOR SUBLISTS AND TO MAINTAIN SUBLISTS WITHIN THE LIST


(defun less-than-limit(val limit)
	(<= val limit))

(defun greater-than-limit(val limit)
	(> val limit))
	
(defun enforce-upper-limit-sublist(limit sblst)
(cond
((null sblst)nil)
((less-than-limit (car sblst) limit)(cons (car sblst) (enforce-upper-limit-sublist limit (cdr sblst))))
((greater-than-limit (car sblst) limit)(cons limit (enforce-upper-limit-sublist limit (cdr sblst))))))
		
(defun enforce-upper-limit(limit lst)
(cond
((null lst)nil)
((listp (car lst))(cons (enforce-upper-limit-sublist limit (car lst)) (enforce-upper-limit limit (cdr lst))))
((less-than-limit (car lst) limit)(cons (car lst) (enforce-upper-limit limit (cdr lst))))
((greater-than-limit (car lst) limit)(cons limit (enforce-upper-limit limit (cdr lst))))))




 ;;modify so that any sublist is inserted in its modified enforce-upper-limit form
;;Test plan for enforce-upper-limit :
;;_________________________________________________________________________________________________________________________
;;category/description                           data                                              expected output  
;;_________________________________________________________________________________________________________________________
;;regular behavior with numbers                  15 '(14 17 18 19)                                  (14 15 15 15)   
;;words                                          5 '(1 7 3 8 kitty) BAD data                         "Accepts integers only"
;;negative maxVal                                -5 '(1 2 3 -6 -7)                                  (-5 -5 -5 -6 -7)
;;singleton list greater than					 4 '(5)												(4)
;;singleton list less than						 4 '(3)												(3)
;;none greater than max							 6 '(1 2 3 4 5)										(1 2 3 4 5)
;;letters                                        5 '(c a d d y) BAD data                             "Accepts integers only"
;;empty list                                     5 '()    											NIL
;;one sublist									 5 '(7 8 3 4 (4 6 7))								(5 5 3 4 (4 5 5))
;;sublists galore								 5 '((-1 -2 6) 5 6 7 (100 40 80 -111) 5 (6 6))		((-1 -2 6) 5 5 5 (5 5 5 -111) 5 (6 6))						