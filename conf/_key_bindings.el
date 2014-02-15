;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'my/server-stop)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Start apps
(global-set-key (kbd "H-x e") 'znc-all)
(global-set-key (kbd "H-x m") 'mu4e)

;; ido-mode
;; set keys for ido-vertical
(defun sd/ido-define-keys () 
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Perform general cleanup.
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Toggle between indentation and beginning of line
(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)

;; TODO: write defun that does dired jump when not in project
;; Dired
;; (global-set-key (kbd "C-x C-j") 'dired-jump)
;; Direx
(global-unset-key (kbd "C-c C-j"))
(global-set-key (kbd "C-c C-j") 'direx-project:jump-to-project-root-other-window)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Move windows, even in org-mode
(global-set-key (kbd "<S-right>") 'windmove-right)
(global-set-key (kbd "<S-left>") 'windmove-left)
(global-set-key (kbd "<S-up>") 'windmove-up)
(global-set-key (kbd "<S-down>") 'windmove-down)

;; window resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; move buffer to window
(global-set-key (kbd "<M-s-up>")     'buf-move-up)
(global-set-key (kbd "<M-s-down>")   'buf-move-down)
(global-set-key (kbd "<M-s-left>")   'buf-move-left)
(global-set-key (kbd "<M-s-right>")  'buf-move-right)

;; Fold the active region
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Toggle linum-mode, remap count-lines
(global-set-key (kbd "C-x l") 'linum-mode)
(global-set-key (kbd "C-x M-l") 'count-lines-page)

;; kill whole line with C-; (because ; is close to k)
(global-set-key (kbd "C-;") 'kill-whole-line)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Search always regex
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; C-tab to go through buffers
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)

(global-set-key (kbd "C-c d") 'dash-at-point)

;; expand region
;; first unset key binding to make follow up = - 0 work
(global-unset-key (kbd "C-="))
(global-set-key (kbd "C-=") 'er/expand-region)

;; jump around, jump around, jump up, jump up and get down
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/edit-lines) ;; adds a cursor to all lines in current region

;; Key chords
(key-chord-define-global "jj" 'ace-jump-word-mode)
(key-chord-define-global "jk" 'ace-jump-char-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jb" 'ace-jump-buffer)
(key-chord-define-global "uu" 'undo-tree-visualize)
(key-chord-define-global "wl" 'visual-line-mode)

(key-chord-mode +1)

;; js2-refactor keybindings start with:
(js2r-add-keybindings-with-prefix "C-c C-m")

(provide '_key_bindings)
