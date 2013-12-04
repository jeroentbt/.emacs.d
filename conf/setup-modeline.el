(size-indication-mode t)

;; Use Smart Modeline
;; standard loading
(setq sml/theme 'dark)
(sml/setup)

;; replace common paths
(add-to-list 'sml/replacer-regexp-list '("^/Volumes/devHD/" "::"))
(add-to-list 'sml/replacer-regexp-list '("^~/dev/" "::"))

;; hide minor modes
(add-to-list 'sml/hidden-modes " Projectile")
(add-to-list 'sml/hidden-modes " ,")
(add-to-list 'sml/hidden-modes " Guide")

(provide 'setup-modeline)
