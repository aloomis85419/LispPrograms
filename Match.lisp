;;Aaron – CS 3210 – Fall 2017
;;==========================================
;;Match: Receives an integer and a list of integers, possibly nested.  
;;		 Match returns a count of how many times the first parameter is found in the list.
;;parameters:
;;	lst: A list of numbers.
;;	countNum: The number to count the occurences of within the list.
;;assumptions:
;;	1.Handles integers only
;;Helper Methods: None	
;;ALL CASES PASSED
;;FINISHED

(defun match(countNum lst)
(cond
((null lst) 0)
((listp (car lst))(match countNum (append (cdr lst) (car lst))))
((= countNum (car lst))(1+ (match countNum (cdr lst))))
(t (match countNum (cdr lst)))))

;;  test plan for match :
;;  category / description		         data		                         expected result
;;  ----------------------------------------------------------------------------------------------------
;;  empty list					         5, ()			                 	 0
;;  singleton match	                     5, (5)	                 			 1
;;  singleton no match		             5, (6)		                         0
;;	multiple elements                    5,(7 5 8 5 3)                       2                    
;;  list consisting of all countNum      5,(5 5 5 5 5)                       5
;;  Nested list                          5, (5 5 (5 7) 6)                    5 