;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p" ;; projectile
                                     "C-c !" ;; flycheck
                                     "C-x r" ;; ... stuff
                                     "C-x 4" ;; file other window
                                     "C-x v" ;; generic version controll
                                     "C-x 8" ;; special chars
                                     "C-x x" ;; persp
                                     ))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(provide 'setup-guidekey)
