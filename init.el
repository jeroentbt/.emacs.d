;; Set some variables based on environment
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Turn off mouse interface early in startup to avoid momentary display
;;;; Do show menu bar (running as cocoa app)
;;;; TODO turn of menu bar when running emacs from terminal
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

;; Set up load path
(setq loadpath-mine (expand-file-name "conf" user-emacs-directory))
(setq loadpath-vendor (expand-file-name "vendor" user-emacs-directory))

(add-to-list 'load-path loadpath-mine)
(add-to-list 'load-path loadpath-vendor)

(require '_packages)
(require '_global)
(require '_appearance)
(require '_key_bindings)

(require 'theme-park-mode)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(when is-mac (require '_mac))
