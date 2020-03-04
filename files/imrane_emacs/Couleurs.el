;;##########################################################
;; definition de l'environnement couleur.
;; nom de couleur voir fichier /var/X11R6/lib/rgb.txt

;; font-lock
;;(modify-face FACE FOREGROUND BACKGROUND STIPPLE BOLD-P ITALIC-P UNDERLINE-P &optional INVERSE-P FRAME)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;; pour le preprocesseur
(modify-face font-lock-builtin-face "DarkKhaki"  nil nil t nil nil)
;; commentaires
(modify-face font-lock-comment-face "indianRed" nil nil t nil nil)      
;; constantes
(modify-face font-lock-constant-face "violetRed"  nil nil t nil nil)
;; ??????
(modify-face font-lock-doc-face "yellow" nil nil nil nil nil)
;; noms de fonctions
(modify-face font-lock-function-name-face "darkorange" nil nil t nil nil)
;; mots reserves
(modify-face font-lock-keyword-face "MediumOrchid1"  nil nil t nil nil)
;; chaines de caracteres
(modify-face font-lock-string-face  "azure4"  nil nil t t nil)
;; types
(modify-face font-lock-type-face "LightSeaGreen" nil nil t nil nil)
;; variables 
(modify-face font-lock-variable-name-face  "DodgerBlue" nil nil t nil nil)
;; ??????
(modify-face font-lock-warning-face "red" nil nil t nil nil)

