;; Interactively Do Things
;; like change-buffer, visit-file, ...

(require 'ido)

(ido-mode t)

(setq ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length 5
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

;;better flex matching
(require 'flx-ido)
(flx-ido-mode t)
;;disable ido faces to see fix highlights
(setq ido-use-faces nil)

;; flx-ido looks better with ido-vertical-mode
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; Ido at point (C-,)
(require 'ido-at-point)
(ido-at-point-mode)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)



(provide 'setup-ido)
