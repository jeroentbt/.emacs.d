(require 'mu4e)
(require 'setup-gnus-dired) ;; attachments from dired, mark C-c RET C-a
(require 'setup-mu4e-PRIVATE) ;; adresses etc
(require 'org-mu4e)

;; use mu4e as default mailclient
(setq mail-user-agent 'mu4e-user-agent ;; default mail client
      mu4e-mu-binary "/usr/local/bin/mu"
      mu4e-get-mail-command "~/bin/offlineimap/offlineimap.py"
      mu4e-update-interval 600
      mu4e-maildir "~/Maildir"
      mu4e-attachment-dir  "~/Downloads/mail-attachments"
      mu4e-action-tags-header "X-Keywords" ;; thanks to offlineimap gmail
      mu4e-attachment-dir "~/Downloads"
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VISUAL

;; use fancy characters where possible
;; (setq mu4e-use-fancy-chars t)

(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

;; convert html messages
;; TODO: removes links...
(setq mu4e-html2text-command "w3m -dump -T text/html")

;; enable inline images
(setq mu4e-view-show-images t)
(setq mu4e-view-image-max-width 400)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-headers-fields '((:human-date . 8) (:flags . 5) (:from-or-to . 22) (:subject))
      mu4e-headers-date-format "%d/%m/%y")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BEHAVIOUR

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
     
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Strip addresses from mu4e-user-mail-address-list when replying.
(setq mu4e-compose-dont-reply-to-self t)

;; apply marks when leaving headers buffer
(setq mu4e-headers-leave-behavior 'apply)

;; Crypto
(setq mu4e-auto-retrieve-keys t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHORTCUTS ETC

;; setup some maildir shortcuts
;; Syncing only All Mail for gmail, of limited use     
;; (setq mu4e-maildir-shortcuts
;;      '( (my/mu4e-maildir-pers . ?j)
;;         (my/mu4e-maildir-pro . ?t)))

(add-to-list 'mu4e-view-actions
             '("retag-message" . mu4e-action-retag-message) t)
(add-to-list 'mu4e-headers-actions
             '("retag-message" . mu4e-action-retag-message) t)

(defun my/mu4e-action-archive-message (msg)
  (mu4e-action-retag-message msg "-\\Inbox"))

(defun my/mu4e-action-trash-message (msg)
  (mu4e-action-retag-message msg "-\\Inbox +\\Trash")
    (mu4e~proc-move docid nil  "+T-N"))

;; TODO: look in to mu4e-mark-execute-all
;; TODO: check if tags are gmail tags before executing
;; this would probably be better if executed by mu4e-mark-execute-all
(defun my/mu4e-action-all-marked (ignored)
  (mu4e-headers-for-each
   (lambda (msg)
     (let ((docid (mu4e-message-field msg :docid)))
      (when (mu4e-mark-docid-marked-p docid)
        (my/mu4e-action-trash-message msg))))))

(add-to-list 'mu4e-headers-actions
             '("xtrash all marked" . my/mu4e-action-all-marked) t)
(add-to-list 'mu4e-view-actions
             '("xtrash all marked" . my/mu4e-action-all-marked) t)


(add-to-list 'mu4e-view-actions
             '("earchive-message" . my/mu4e-action-archive-message) t)
(add-to-list 'mu4e-headers-actions
             '("earchive-message" . my/mu4e-action-archive-message) t)
(add-to-list 'mu4e-view-actions
             '("trash message" . my/mu4e-action-trash-message) t)
(add-to-list 'mu4e-headers-actions
             '("trash message" . my/mu4e-action-trash-message) t)
(add-to-list 'mu4e-view-actions
             '("View in browser" . mu4e-action-view-in-browser) t)

(add-to-list 'mu4e-bookmarks '("tag:\\\\Sent and date:1w..now" "Sent this week" ?s))
(add-to-list 'mu4e-bookmarks '("flag:unread and date:today..now" "Today's unread messages" ?d))
(add-to-list 'mu4e-bookmarks '("tag:\\\\Inbox and date:today..now" "Today's inbox" ?n))
(add-to-list 'mu4e-bookmarks '("tag:\\\\Inbox" "Unified inbox" ?I))
(add-to-list 'mu4e-bookmarks '("tag:-Social" "Category Social" ?S) t)
(add-to-list 'mu4e-bookmarks '("tag:-Promotions" "Category Promotions" ?P) t)
(add-to-list 'mu4e-bookmarks '("tag:-Updates" "Category Updates" ?U) t)
(add-to-list 'mu4e-bookmarks '("tag:-Forums" "Category Forums" ?F) t)
(add-to-list 'mu4e-bookmarks '("tag:\\\\Inbox NOT tag:-Social NOT tag:-Forums NOT tag:-Updates NOT tag:-Promotions" "Unified inbox Clean" ?i))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DEFUNS

;; from mu4e docs     
(defun my/mu4e-set-account ()
  "Set the account for composing a new message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my/mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my/mu4e-account-alist)
                                     nil t nil nil (caar my/mu4e-account-alist))))
          (account-vars (cdr (assoc account my/mu4e-account-alist))))
         (if account-vars
             (mapc #'(lambda (var)
                       (set (car var) (cadr var)))
                   account-vars)
           (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my/mu4e-set-account)
     
;; sending mail 
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu
     
(require 'smtpmail)
(require 'smtpmail-async)
(setq ;; send-mail-function 'async-smtpmail-send-it 
      ;; message-send-mail-function 'async-smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 my/smtpmail-address nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      ;; message queue for offline sending
      smtpmail-queue-mail nil ;; start in non-queueing mode
      smtpmail-queue-dir "~/Maildir/queue/cur"
      )
     
;; alternatively, for emacs-24 you can use:
;;(setq message-send-mail-function 'smtpmail-send-it
;;     smtpmail-stream-type 'starttls
;;     smtpmail-default-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-service 587)
     
(provide 'setup-mu4e)


;; TODO:
;; http://pablo.rauzy.name/dev/init.el.html
;; https://github.com/magnars/.emacs.d/blob/c1a481c9ba85ab3127bb77c7b60689abbbeb5611/setup-mu4e.el
;; https://github.com/agpchil/mu4e-maildirs-extension
;; https://bitbucket.org/seanfarley/dotfiles/src/69cbcf0dd9d6cb2c7aaa18e7a196315035ad4181/emacs/init/mail.el?at=default

;; reference 
;; https://github.com/djcb/mu/blob/master/mu4e/mu4e-actions.el
