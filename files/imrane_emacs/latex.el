(defun latex_tpl_item ()
  (interactive)
  (insert
   "\\begin{itemize}
\\item 
\\item 
\\item 
\\item 
\\item 
\\item 
\\item 
\\item 
\\item 
\\item 
\\end{itemize}
")
  (previous-line 11)
  (end-of-line)) 


(defun latex_tpl_tab ()
  (interactive)
  (insert
   "\\begin{tabular}{}
\\hline
\\textbf{} & \\textbf{}  \\\\
\\hline
 & \\\\
\\hline
\\end{tabular}
")
  (previous-line 7)
  (end-of-line)
  (backward-char 1)
  ) 

(defun latex_tpl_href ()
  (interactive)
  (insert
   "\\href{}{}")
  (end-of-line)
  (backward-char 3)
  ) 





(defun latex_block_concat (name)
  (concatenate 'string 
	       (concatenate 'string 
			    (concatenate 'string 
					 (concatenate 'string "\\begin{" name)
					 "}\n\n\\end{"	)
			    name
			    )
	       "}\n")
  )

(defun latex_tpl_block (name)
  (interactive)
  (insert 
   (latex_block_concat name))
  (previous-line 2)
  (end-of-line)
  ) 


(defun latex_tpl_cmd (name)
  (interactive)
  (insert 
   (concatenate 'string 
		(concatenate 'string "\\" name)
		"{}"	)
   )
  (end-of-line)
  (backward-char 1)
  ) 



