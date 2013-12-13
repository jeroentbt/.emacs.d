;; do stuff for langs

;; set up mode - repl pairs
;; if you add one here that works, report @ https://github.com/tomterl/repl-toggle
(setq rtog/mode-repl-alist '((js2-mode . nodejs-repl)
                             (js3-mode . nodejs-repl)
                             (emacs-lisp-mode . ielm)
                             (php-mode . php-boris)
                             ))

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
(add-hook 'js2-mode-hook 'repl-toggle-mode)
;; repeat for js3-mode /TODO there must be a better way to define these
(add-hook 'js3-mode-hook 'flycheck-mode)
(add-hook 'js3-mode-hook (lambda () (tern-mode t)))
(add-hook 'js3-mode-hook 'repl-toggle-mode)

;; json
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-hook 'json-mode-hook 'flycheck-mode)


;; web mode
(add-to-list 'auto-mode-alist '("\\.txp\\'" . web-mode))
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'flycheck-mode)

(provide 'setup-langs)
