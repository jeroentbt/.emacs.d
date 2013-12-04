;; Apple specific stuff

;; On OS X GUI applications do not inherit variables from the shell
;; configuration and thus have a different $PATH
;; test by doing "M-: (executable-find "flake8")"
;; C-h v exec-path
(exec-path-from-shell-initialize)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

(provide '_mac)
