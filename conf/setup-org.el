
(setq org-agenda-files '("~/Dropbox/org/notes.org"))

(setq org-directory "~/Dropbox/org")

;; Tell me when editing stuff I can't see
(setq org-catch-invisible-edits (quote show-and-error))

;; install then first...
(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")

;; osx
;; (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/7987/plantuml.7987.jar")
(setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (plantuml . t)))

;; MobileOrg
;;osx
;;(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-directory "~/Dropbox/mobileOrg")
(setq org-mobile-files '(org-agenda-files
                         "~/Dropbox/org/trickle.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")

(provide 'setup-org)
