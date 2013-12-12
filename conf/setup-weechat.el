;; good source: https://github.com/the-kenny/.emacs.d/blob/master/site-start.d/weechat.el

(setq weechat-modules '(weechat-button
                        weechat-complete
                        weechat-tracking
                        ;;weechat-notifications
                        ))

(eval-after-load 'weechat
  '(progn
     (setq weechat-host-default "localhost"
           weechat-port-default 9000
           weechat-mode-default 'plain
           weechat-color-list
           '(unspecified "black" "dark gray" "dark red" "red"
                         "dark green" "light green" "brown"
                         "yellow" "RoyalBlue3"
                         "light blue"
                         "dark magenta" "magenta" "dark cyan"
                         "light cyan" "gray" "white")
           weechat-prompt "> "
           weechat-notification-mode t
           weechat-auto-monitor-buffers '("#trickle" "#meteor")
           weechat-complete-nick-ignore-self nil
           weechat-button-buttonize-nicks nil
           weechat-tracking-types '(:highlight (".+#weechat.el" . :message))
           weechat-sync-active-buffer t
	   )
     ;;(require 'gnutls)
     ;;(add-to-list 'gnutls-trustfiles (expand-file-name (concat user-emacs-directory "/relay.crt")))
     (set-face-background 'weechat-highlight-face "dark red")
     (set-face-foreground 'weechat-highlight-face "light grey")
     (add-hook 'weechat-mode-hook 'visual-line-mode)
     ;; (add-hook 'weechat-mode-hook (lambda nil (load-theme-buffer-local 'tango (current-buffer))))
     (tracking-mode)))


(provide 'setup-weechat)

