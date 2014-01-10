(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/solarized-theme")
(load-theme 'solarized-dark t)

;; don't beep but flash the screen
;; font-lock-mode provides the colors for spec languages, set max fontification (1-3)
;; force color theme (no increments)
;; don't truncate on partial width
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Don't highlight matches with jump-char - it's distracting
(setq jump-char-lazy-highlight-face nil)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)


(provide '_appearance)
