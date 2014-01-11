;; I'm using znc...
(require 'znc) ;; in vendor
(require 'erc-terminal-notifier)

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

;; wrap lines to buffer when typing
(add-hook 'erc-mode-hook 'visual-line-mode)


(setq erc-timestamp-only-if-changed-flag nil ;; always timestamp
      erc-timestamp-format "%H:%M:%S "
      erc-fill-prefix nil ;; don't force indentation
      erc-insert-timestamp-function 'erc-insert-timestamp-left ;; put the timestamp left
      erc-hide-list '("JOIN" "PART" "QUIT") ;; hide pesky stuff
      erc-input-line-position -1
      erc-prompt ">"
      erc-current-nick-highlight-type (quote all) ;; highlight full message to me
      erc-fill-column 85
      ;; matches
      erc-text-matched-hook '(erc-log-matches 
                              erc-terminal-notifier-text-matched)
      erc-match-exclude-server-buffer t ;; don't bother matching the server buffer
      ;; log matches
      erc-log-matches-flag t ;; log mentions and keywords in their own buffer
      erc-log-matches-types-alist '((keyword . "#ERC Keywords") 
                                    (current-nick . "#ERC Mentions"))
      )

(provide 'setup-znc-erc)
