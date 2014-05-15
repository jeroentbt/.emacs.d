(require 'indicators)


(defun my/load-default-indicators ()
  (interactive)
  (indicators-mode t)
  ;; show a little arrow at the end of buffer using the default fringe face
  (ind-create-indicator 'point-max
                        :managed t
                        :relative nil
                        :fringe 'left-fringe
                        ;; :bitmap 'right-arrow
                        :bitmap 'hollow-square
                        :face 'fringe)

  ;; show relative position in the file (a.k.a. scroll bar)
  (ind-create-indicator 'point :managed t))

(provide 'setup-indicators)
