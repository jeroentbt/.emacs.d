;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p" "C-c !" "C-x r" "C-x 4" "C-x v" "C-x 8" "C-x x"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(provide 'setup-guidekey)
