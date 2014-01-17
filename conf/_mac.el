;; Apple specific stuff

;; On OS X GUI applications do not inherit variables from the shell
;; configuration and thus have a different $PATH
;; test by doing "M-: (executable-find "flake8")"
;; C-h v exec-path
(exec-path-from-shell-initialize)

;; This is for mu4e to be able to get gpg going (sig verifying etc)
;; I was unable to M-x getenv RET GPG_AGENT_INFO (even if I manually set it,
;; as gpg-agent form gpgtools.org does not export this)
;; M-x shell-copy-environment-variable was no help either
;; This should be no problem in *nix's
(setenv "GPG_AGENT_INFO" "~/.gnupg/S.gpg-agent")

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

(provide '_mac)
