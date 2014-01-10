;; I'm using znc...
(require 'znc) ;; in vendor

;; modules..
(setq erc-modules '(autojoin
                    button
                    completion
                    fill
                    irccontrols
                    keep-place
                    list
                    match
                    menu
                    move-to-prompt
                    netsplit
                    networks
                    noncommands
                    ;; notifications
                    readonly
                    ring
                    scrolltobottom
                    smiley
                    stamp
                    track))


;; add some color to nicks
(require 'erc-hl-nicks)
(add-hook 'erc-mode-hook 'erc-hl-nicks-mode)


(setq erc-timestamp-only-if-changed-flag nil ;; always timestamp
      erc-timestamp-format "%H:%M:%S "
      erc-fill-prefix nil ;; don't force indentation
      erc-insert-timestamp-function 'erc-insert-timestamp-left ;; put the timestamp left
      erc-hide-list '("JOIN" "PART" "QUIT") ;; hide pesky stuff
      erc-input-line-position -1
      erc-prompt ">"
      )

(provide 'setup-znc-erc)
