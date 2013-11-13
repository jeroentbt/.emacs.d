(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'flycheck-mode)

(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 81)))

(provide 'setup-python)
