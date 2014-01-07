;; from: http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
;; This function will mirror all directories at the given backup dir. 
;; For example, if you are editing a file /Users/j/web/xyz/myfile.txt,
;; and your backup root is 
;; /Users/j/.emacs.d/emacs-backup/, then the backup will be at 
;; /Users/j/.emacs.d/emacs-backup/Users/j/web/xyz/myfile.txt~.

;; make backup to a designated dir, mirroring the full path

(defun my/backup-file-full-dir (fpath)
  "Return a new backup file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir (expand-file-name
                 (concat user-emacs-directory "backups")))
        ;;(backupRootDir "~/.emacs.d/emacs-backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)
