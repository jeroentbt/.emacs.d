;; major mode for working with web files

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.txp\\'" . web-mode))

(provide 'setup-webmode)
