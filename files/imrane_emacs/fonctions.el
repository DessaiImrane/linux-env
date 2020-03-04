;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; definition des fonctions personnels.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonctions vectra

(defun vectra-indent-hilit-buffer ()
  "Indente et colorise le buffer courant" 
  (interactive)
  (indent-region (point-min) (point-max) 'nil)
  (font-lock-fontify-buffer)
  )

(defun vectra-color-test ()
  "Fixe comme couleur de fonte principale celle dont le nom est pointé par le curseur"
  (interactive)
  (set-foreground-color (current-word)))

(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointé par le curseur"
  (interactive)
  (manual-entry (current-word)))

(defun vectra-apropos-on-word ()
  "Appelle le apropos sur le mot pointé par le curseur"
  (interactive)
  (apropos (current-word)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonctions de Sébastien Dinot

;; Conversion des fins de lignes du format MS-DOS au format Unix
(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)
    (replace-match "")
    )
  )

;; Conversion des fins de ligne du format Unix au format MS-DOS
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t)
    (replace-match "\r\n")
    )
  )

;; Montrer la table des caractères ASCII étendus
;; Fonction fournie par Alex Schroeder <asc@bsiag.com>
(defun ascii-table ()
  "Afficher la table de caractères ASCII."
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "Caractères ASCII de code 1 à 254.\n"))
  (let ((i 0))
    (while (< i 254) (setq i (+ i 1))
	   (insert (format "%4d %c\n" i i))
	   )
    )
  (beginning-of-buffer)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonctions de Young-Il Choo

;; Défilement des tampons avec filtre des tampons non souhaités
;; Fonctions fournies par Young-Il Choo <choo@cs.yale.edu>
(defun yic-ignore (str)
  (or
					; Liste des tampons à systématiquement ignorer
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^\\*scratch\\*$" str)
   (string-match "^ " str)

					; Ignorer aussi les tampons déjà visibles dans une autre trame de
					; cette même instance d'Emacs.
   (memq str
	 (mapcar
	  (lambda (x)
	    (buffer-name
	     (window-buffer
	      (frame-selected-window x)
	      )
	     )
	    )
	  (visible-frame-list)
	  )
	 )
   )
  )

;; Sélection du tampon suivant dans la liste en tenant compte de
;; ceux qui doivent être ignorés.
(defun yic-next (ls)
  "Déterminer le prochain tampon valide à afficher"
  (let* ((ptr ls)
	 bf bn go
	 )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))
	  (setq go bf)
	  (setq ptr (cdr ptr))
	  )
      )
    (if go (switch-to-buffer go))
    )
  )


;; Affichage du tampon précédent dans la liste des tampons valides
(defun yic-prev-buffer ()
  "Afficher le tampon suivant en ignorant ceux non souhaités"
  (interactive)
  (yic-next (reverse (buffer-list)))
  )


;; Affichage du tampon suivant dans la liste des tampons valides
(defun yic-next-buffer ()
  "Afficher le tampon précédent en ignorant ceux non souhaités"
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list))
  )

;; comment line below the cursos
(defun comment-line ()
  (interactive)
  (beginning-of-line)
  (setq st (point))
  (end-of-line)
  (setq en (point))
  (if (> en st)
      (comment-region st en))
  (next-line 1)
  )

;; uncomment line below the cursos
(defun uncomment-line ()
  (interactive)
  (beginning-of-line)
  (setq st (point))
  (end-of-line)
  (setq en (point))
  (if (> en st)
      (uncomment-region st en))
  (next-line 1)
  )