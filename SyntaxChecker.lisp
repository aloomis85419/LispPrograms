;;  Aaron Loomis – CS 3210 – Fall 2017
;;  ================================================================
;;MAIN METHOD
;;checker:  A function which checks the syntax of a (possibly nested) list of expressions with numeric operands and binary infix operators (the operators are the actual words): plus, minus, times, dividedby.  
;;			The checker returns nil if any of the following three error conditions are found, true otherwise: wrong number of tokens in an expression (i.e., not three), operands not numeric, invalid operator.  
;;			Do not consider any other errors and do not provide data with any other errors.  
;;			Your main function should call three helper functions, which each check one condition.  
;;			If an input list contains more than one error, the function terminates and reports on only the first error.  
;;parameters:
;;       lst – a list of elements of arbitrary type.
;;assumptions: 
;;		1. The list 
;;		2. The list consists of integers.

;;HELPER METHODS: 
;;==================================================================================================================================================
;;invalid-elements: Checks to see if an entire expression (includes sublists) follows the syntax rules. 
;					Sublists are added to the end of the list, creating a single list.
;;parameters:
;;		lst - a list of elements of arbitrary type.
;;Assumptions: Null list cannot be passed in directly to this method. The checker method ensures this does not happen.
;;==================================================================================================================================================
;;Flatten - Adds sublists as elements so that the list can be treated as one list. Tested in the Flatten.lisp program included in this assignment.
;;parameters:
;;		lst - a list of elements of arbitrary type.
;;Assumptions: Given in 
;;==================================================================================================================================================
;;sublist-invalid-length-checker - The number of operands in sublists is considered separately from the entire list. This method enforces the three operand rule. 
;;								   Returns false if the lists contains a sublist with length < 3.
;;parameters:
;;		lst - a list of elements of arbitrary type.
;; Assumptions: none
;;==================================================================================================================================================
		
(defun checker(lst)
(cond
((/= (length lst)3 )nil)
((equal (sublist-valid-length-checker lst) nil)nil)
((equal (invalid-elements (flatten lst)) nil) nil)
(t 'T)))

;;TRIVIAL METHODS are tested as part of testing for non-trivial methods
(defun is-plus(elmnt)
(equal elmnt 'plus))

(defun is-minus(elmnt)
(equal elmnt 'minus))

(defun is-times(elmnt)
(equal elmnt 'times))

(defun is-divide-by(elmnt)
(equal elmnt 'divideby))

(defun is-number(elmnt)
(numberp elmnt))

(defun length-valid(lst)
(= (length lst) 3))
;;END OF TRIVIAL METHODS

(defun invalid-elements(lst)
(cond
((null lst) 'F)
((is-plus (car lst)) (invalid-elements (cdr lst)))
((is-minus (car lst)) (invalid-elements (cdr lst)))
((is-times (car lst)) (invalid-elements (cdr lst)))
((is-divide-by (car lst)) (invalid-elements (cdr lst)))
((is-number (car lst)) (invalid-elements (cdr lst)))))

(defun sublist-valid-length-checker(lst)
(cond 
((null lst)nil)
((listp (car lst))(length-valid (car lst)))
(t (sublist-valid-length-checker (cdr lst)))))

(defun flatten (lst)
(cond 
((null lst) nil)
((atom (car lst)) (cons (car lst) (flatten (cdr lst))))
(t (append (flatten (car lst)) (flatten (cdr lst))))))

;;  test plan for checker
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list numeric invalid length						'(5)																 NIL
;;  singleton list operator invalid length                      '(plus plus) 														 NIL
;;  valid expression length 3									'(5 plus 4)															 T
;;  valid expression nested list								'(1 minus (3 plus 2))												 T
;;  invalid length nested list								    '(1 minus (5 plus 4) minus (5 divideby 3))							 NIL
;;  valid length all invalid operands							'(cat cat cat)														 NIL
;;  valid operands invalid length 								'(1 2 3 4 5 6)														 NIL
;;  invalid operator in sublist-checker							'(1 divideby (1 + 5))												 NIL
;;  sublist with wrong number of operands						'(1 divideby (1 plus))												 NIL
;;  empty sublist												'(1 divideby ())													 NIL
;;  multiple sublists valid										'((1 divideby 4) minus (1 divideby 4))								 T    //FROM HERE ON DOWN CASES DON'T PASS DUE TO AN INABILITY TO HANDLE TWO SUBLISTS
;;  multiple sublists invalid length							'((1 divideby 4) minus (1 divideby))								 NIL
;;  multiple sublists invalid operand							'((1 divideby 4) minus (1 divideby cat))						     NIL

;;  test plan for invalid-elements: NOTE: This method recieves a list that has been converted into a single list by the flatten method.
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													Checked in checker method											 Checked in checker method
;;  singleton list												'(5)																 F VALID
;;  singleton list invalid										'(cat)																 NIL INVALID
;;  list with sublists											'(1 plus 1 minus 5)												     F	VALID
;;  list with bad operands and operators						'(1 plus 4 + cat)													 NIL INVALID
;;  all valid													'(1 plus 9 minus 7 times 6 divideby 8)								 F VALID

;;  test plan for length-valid
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'()																	 NIL
;;  singleton list												'(5)																 NIL
;;  length larger than 3										'(4 plus 5 plus 2)													 NIL
;;  length less than 3											'(4 plus)															 NIL
;;  length equal to 3											'(4 plus 3)															 T												

;;  test plan for sublist-valid-length-checker
;;  category / description		                				data		                       									expected result
;;  ------------------------------------------------------------------------------------------------------------------------------------------------
;;  empty list													'(1 plus ())													     NIL
;;  singleton sublist											'(1 plus (5))														 NIL
;;  double sublist valid length									'((1 plus 3) minus (1 plus 3))										 T
;;  double sublist invalid length								'((1 plus) minus (1 plus 3))										 NIL
;;  no-sublist													'(1 plus 3)															 NIL											 



