;;  Aaron Loomis – CS 3210 – Fall 2017
;;  ============================================
;;  flatten: Receives a list of arbitrary depth, and returns a list containing all the same elements, in the same order, but now at the top level.  
;;  Note that flattening an embedded NIL (empty list) removes it.
;;  parameters:
;;       lst – a list of elements of arbitrary type.
;;  assumptions: None
;; ALL TESTS PASS

(defun flatten (lst)
(cond 
((null lst) nil)
((atom (car lst)) (cons (car lst) (flatten (cdr lst))))
(t (append (flatten (car lst)) (flatten (cdr lst))))))
	
;;  test plan for flatten:
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list high depth									'((((bob))))														(bob)
;;  singleton list low depth									'(bob)																(bob)
;;  multiple element w/sublists of arbitrary depth				'(tom bob (tom bob) 5 (5("john")) "john" 9 k t (cat(terry)))	    (tom bob tom bob 5 5 "john" "john" 9 k t cat terry)	
;;  stacked/nested lists w/high depth							'(1(2(3(4(5(6(7)8)9)10)11)12)13)									(1 2 3 4 5 6 7 8 9 10 11 12 13)
