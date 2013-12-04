;; do stuff for langs

;; php
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-hook 'php-mode-hook 'flycheck-mode)

;; python
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 81)))

;; javascript (js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; web mode
(add-to-list 'auto-mode-alist '("\\.txp\\'" . web-mode))
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'flycheck-mode)

(provide 'setup-langs)
