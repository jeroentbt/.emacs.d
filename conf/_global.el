
;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))




;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
;; This is nicer with 'visual-line-mode (and adaptive wrap)
(setq-default truncate-lines t)

;; Keep cursor away from edges when scrolling up/down
(require 'smooth-scrolling)

;; Allow recursive minibuffers
;; (setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
;; not available on MELPA
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

;; Smart M-x : ido like interactivity for M-x
;; when ido-ubiquitous is used, smex is just used to keep
;; a history of last used commands.
;; TODO: check previous statement about smex and ido-ubiquitous
(require 'smex)
(smex-initialize)

;; Hide mousepointer when typing
(setq make-pointer-invisible t)

;; erc made the pointer go off screen, forcing a recenter
;; oufo on #emacs suggested this: (works great)
(setq scroll-conservatively 1000)

;; truncate comint buffers
(require 'setup-comint)

(provide '_global)
