;;  Aaron Loomis – CS 3210 – Fall 2017
;;  =============================================
;;  twin: Twin receives a list and doubles all elements.
;;	untwin: receives a list which may have paired (adjacent equal) elements, and removes one of each pair.  Pairs are defined as adjacent equal values.
;;  parameters:
;;       lst – a list of elements of arbitrary type.
;;  assumptions: 
;;		1. the list is not nested, no more than two identical elements will be adjacent.
;; ALL TESTS PASS
;; FINISHED

(defun twin(lst)
(cond
((null lst)nil)
((equal(car lst) (car(cdr lst)))  (cons (car lst) (cons (car (cdr lst)) (twin (cdr (cdr lst))))))
((not(equal(car lst) (car(cdr lst))))  (cons (car lst)(cons (car lst) ( twin (cdr lst)))))))


(defun untwin(lst)
(cond
((null lst)nil)
((equal(car lst) (car(cdr lst)))  (untwin (cdr lst)))
((not(equal(car lst) (car(cdr lst))))(cons (car lst) (untwin (cdr lst)))))) 

;;  test plan for twin:
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list												'(bob)																(bob bob)
;;  mixed data types w/dups                                     '(bob "bob" 6 bob)													(bob bob "bob" "bob" 6 6 bob bob)
;;	all adjacent dups											'(1 2 3 4 5 6 7 8)													(1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8)
;;  dups non-adjacent											(1 2 1 2 3 4 3 4 5 6 5 6 7 8 7 8)									(1 1 2 2 1 1 2 2 3 3 4 4 3 3 4 4 5 5 6 6 5 5 6 6 7 7 8 8 7 7 8 8)
;;  one item not dup 											'(1 1 2 2 3)														(1 1 2 2 3 3)

;;  test plan for untwin:
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list												'(bob)																(bob)
;;  mixed data types w/dups                                     '(bob bob "bob" "bob" 6 bob bob)									(bob "bob" 6 bob)
;;	all adjacent dups											'(1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8)									(1 2 3 4 5 6 7 8)
;;  dups non-adjacent											'(1 2 1 2 3 4 3 4 5 6 5 6 7 8 7 8)									(1 2 1 2 3 4 3 4 5 6 5 6 7 8 7 8)										
									