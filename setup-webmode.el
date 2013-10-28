;; major mode for working with web files

(require 'web-mode)
(require 'emmet-mode)

(add-to-list 'auto-mode-alist '("\\.txp\\'" . web-mode))

(add-hook 'web-mode-hook  'emmet-mode)

(provide 'setup-webmode)
