;; define function to shutdown emacs server instance
(defun my/server-stop ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )
