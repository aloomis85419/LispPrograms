;;Aaron – CS 3210 – Fall 2017
;;======================================
;;count-groups: Given a list, count the number of groups (a group is two or more identical adjacent items).  
;;parameters:
;;	lst: A list of numbers.
;;	countNum: The number to count the occurences of groups within the list.
;;Assumption: 
;;1.the list contains no nested lists.
;;Helper Methods: 
;;process-groups: Used to identify a group as a single unit of adjacent items and increment a count.
;;ALL CASES PASSED 

(defun count-groups(lst)
(cond
((null lst) 0)
((not(equal (car lst) (car (cdr lst))))(count-groups (cdr lst)))
((equal (car lst) (car (cdr lst))) (process-group lst))))

(defun process-group(lst)
(cond
((equal (car lst) (car (cdr lst)))(process-group (cdr lst)))
(t  (1+(count-groups lst)))))

;;  test plan for count-groups :
;;  category / description		         data		                         expected result
;;  ----------------------------------------------------------------------------------------------------
;;  empty list					         '()			                 	     0
;;  singleton 	                         '(5)	                 			     0
;;	one long group                       '(5 5 5 5 5 5)                          1                    
;;  many groups dispersed non groups     '(5 5 6 6 7 8 8 4 4 9)                  4
;;  no groups w/word test                '(testing in lisp is easy)				 0			