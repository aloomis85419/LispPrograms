;;  Aaron Loomis – CS 3210 – Fall 2017
;;  ================================================================
;;almost-sorted: A function that receives a list of numbers and returns true or nil for whether the list is almost sorted in ascending order.  
;;               An almost sorted list is defined as one in which the number of inversions is less than 0.2n (n being the number of elements in the list). 
;; 				 A inversion is a pair of adjacent values in the wrong order.  
;;               Completely sorted lists (no inversions) are considered to not be almost sorted (because they are fully sorted). 
;;parameters:
;;       lst – a list of elements of arbitrary type.
;;assumptions: 
;;		1. The list contains no duplicates.
;;		2. The list consists of integers.
;;helper methods: 
;;		inversions: counts the number of elements that arent in sorted order.
;;parameters:
;;		lst - a list of elements of arbitrary type.
;;ALL TESTS PASS
;;FINISHED

(defun count-inversions(lst)
(cond
((equal (car (cdr lst)) nil)  0)
((> (car lst) (car (cdr lst))) (1+ (count-inversions(cdr lst))))
(t (count-inversions (cdr lst)))))

(defun is-almost-sorted(lst)
(cond 
((null lst)nil)
((equal (count-inversions lst) 0) 'sorted)    
((<= (count-inversions lst) (* .2 (length lst))))))

;;  test plan for count-inversions:
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list												'(5)																 0
;;  no inversions												'(7 8 9 10)															 0
;;	one inversion												'(1 2 3 5 4 6 7 8)													 1
;;  no sorting all inversions									'(5 4 3 2 1)														 4

;;  test plan for is-almost-sorted:
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list												'(5)																 NIL
;;  no inversions												'(7 8 9 10)															 NIL
;;	one inversion												'(1 2 3 5 4 6 7 8)													 T
;;  no sorting all inversions									'(5 4 3 2 1)														 NIL
;;  some inversions												'(1 4 3 2 5 6 7 9 8 10)												 NIL
;;  some inversions almost sorted                               '(1 2 4 3 5 6 8 7 9 10) 											 T
