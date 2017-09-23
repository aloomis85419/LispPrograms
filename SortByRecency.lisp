;;  Aaron – CS 3210 – Fall 2017
;;  ============================
;;  make-recent: Takes a word and a list of words.  
;;				If the word is not in the list, it is added at the beginning of the list.  
;;				If the word is in the list, its position is changed to be first in the list.  
;;				In both cases, the word most recently added is now at the front of the list.
;;parameters:
;;		searchWord: A word to search for in the list
;;		dictionary: a list of words
;;assumptions:
;;1.The list of words contains no duplicates
;;Helper Methods: 
;;	wordSearch: Returns true if the word passed in is in the list. False if not.
;;	testLength: checks to see if the length of the word list is 0.
;;  reOrder: If the word is in the list, reOrder places it at the front of the list. 
;;ONE TEST IS NOT PASSING

(defun wordSearch(searchWord dictionary)
(cond
((testLength dictionary) nil)
((equal searchWord (car dictionary)))
((not(equal searchWord (car dictionary))) (wordSearch searchWord (cdr dictionary)))))
			
(defun make-recent(searchWord dictionary)
(cond 
((wordSearch searchWord dictionary)(reOrder searchWord dictionary))
((equal (wordSearch searchWord dictionary) nil)(append (list searchWord) dictionary))))
	
(defun reOrder(word dict)
(cond
((equal word (car dict))dict)
((not(equal word (car dict)))(reOrder word (cons (car dict)(reOrder word (cdr dict))))))) 
	
(defun testLength(dict)
(= (length dict) 0))
	
;; I BELIEVE THIS TESTS ALL HELPER METHODS AND SPECIFICATIONS FOR THE PROGRAM
;;  test plan for make-recent:
;;  category / description		         data		                         expected result
;;  ----------------------------------------------------------------------------------------------------
;;  empty list					         "bob", ()			                 ("bob") 
;;  nil passed as searchword 	         nil,("bob" "cat")	                 (nil "bob" "cat")
;;  searchWord not in list		         "bob",("cat")		                 ("bob" "cat")
;;	searchWord in list                   "bob",("cat","bob")                 ("bob" "cat") note: No new word is added. Position of bob is what changed.
;;  number that is a string   	         "1" ,("cat")		                 ("1" "cat")	  note: 1 might have quotes around it.
;;  nil as search word and empty list    nil, ()                       		 NIL
;;  long list searchword in list		 'bob '(jerry bob terry)			 (bob jerry terry)	;;NOT PASSING	
	
