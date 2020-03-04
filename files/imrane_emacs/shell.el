(defun shell_for ()
  (interactive)
  (insert
   "for x in 
do

done
")
  (previous-line 4)
  (end-of-line)
  (backward-char 1)
  ) 

(defun shell_if ()
  (interactive)
  (insert
   "if []
then

else

fi
")
  (previous-line 6)
  (end-of-line)
  (backward-char 1)
  ) 


(defun shell_case ()
  (interactive)
  (insert
   "case  in
)

)

*)
esac
")
  (previous-line 7)
  (end-of-line)
  (backward-char 3)
  ) 


(defun shell_while ()
  (interactive)
  (insert
   "while 
do

done
")
  (previous-line 4)
  (end-of-line)
  ) 


(defun shell_save_ifs ()
  (interactive)
  (insert
   "IFS_OLD=$IFS 
IFS=
IFS=$OLD_IFS")
  (previous-line 1)
  (end-of-line)
  ) 


(defun shell_save_pwd ()
  (interactive)
  (insert
   "PWD_OLD=$PWD 
PWD=
PWD=$OLD_PWD")
  (previous-line 1)
  (end-of-line)
  ) 
