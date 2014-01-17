(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      `(("default"
         ("emacs.d"
          (filename . "/.emacs.d/"))
         ("emacs"
          (or
           (name . "^\\*scratch\\*$")
           (name . "^\\*Messages\\*$")
           (name . "^\\*Help\\*$")
           (name . "^\\*Completions\\*$")
           (name . "^\\*Quail Completions\\*$")
           (name . "^\\*Compile-Log\\*$")))
         ("Code"
          (or
           (mode . c-mode)
           (mode . c++-mode)
           (mode . perl-mode)
           (mode . python-mode)
           (mode . ruby-mode)
           (mode . emacs-lisp-mode)
           (mode . lisp-mode)
           (mode . sh-mode)
           (mode . php-mode)
           (mode . xml-mode)
           (mode . html-mode)
           (mode . web-mode)
           (mode . css-mode)
           (mode . js-mode)
           (mode . js2-mode)
           (mode . js3-mode)))
         ("Mail"
          (or
           (mode . message-mode)
           (mode . mail-mode)
           (mode . mu4e-main-mode)
           (mode . mu4e-headers-mode)
           (mode . mu4e-view-mode)
           (mode . mu4e-compose-mode)))
         ("Chat"
          (or
           (mode . erc-mode)
           (name . "^\\#ERC Mentions$")
           (mode . identica-mode)
           (mode . twitter-mode)))
         ("Dired"
          (or
           (mode . dired-mode)
           (mode . direx-mode)))
         )))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'setup-ibuffer)
