;; do stuff for langs

;; set up mode - repl pairs
;; if you add one here that works, report @ https://github.com/tomterl/repl-toggle
(setq rtog/mode-repl-alist '((js2-mode . nodejs-repl)
                             (js3-mode . nodejs-repl)
                             (emacs-lisp-mode . ielm)
                             (php-mode . php-boris)
                             ))







;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)



(provide 'setup-langs)
