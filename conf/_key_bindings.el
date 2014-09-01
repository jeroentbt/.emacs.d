
;; Start apps
(global-set-key (kbd "H-x e") 'znc-all)
(global-set-key (kbd "H-x m") 'mu4e)

;; Perform general cleanup.
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

;; Fold the active region
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)






;; org-mode


(provide '_key_bindings)
