;; magit: emacs git integration
;; http://magit.github.io/magit/magit.html#dir

;; restore previous window arrangement when quitting magit
(setq magit-restore-window-configuration t)

;; open commit in a new buffer (pop new window not a new frame)
;; currently broken in magit. using magit-log-edit.el from
;; https://github.com/magit/magit-log-edit as a temp patch
;;(setq magit-server-window-for-commit nil)

;; open status in a new buffer (pop new window not a new frame)
;; (setq magit-status-buffer-switch-function 'pop-to-buffer)

;; show contents of untracked directories
(setq magit-status-verbose-untracked t)

(provide 'setup-magit)
