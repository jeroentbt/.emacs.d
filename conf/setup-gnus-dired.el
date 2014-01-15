;; Attach files via dired
;; mark, C-c RET C-a
;; from http://www.djcbsoftware.nl/code/mu/mu4e/Attaching-files-with-dired.html#Attaching-files-with-dired

(require 'gnus-dired)

;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
     	(when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
     	  (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(provide 'setup-gnus-dired)
