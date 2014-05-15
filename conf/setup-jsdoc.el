(setq js-doc-mail-address "jeroen@tinktenk.be"
      js-doc-author (format "Jeroen Tiebout <%s>" js-doc-mail-address)
      js-doc-url "http://tinktenk.be"
      js-doc-license "MIT")

(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(provide 'setup-jsdoc)
