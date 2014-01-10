(require 'direx)
(require 'direx-project)
(require 'popwin)

(push '(direx:direx-mode :position left :width 40 :dedicated t)
      popwin:special-display-config)

(provide 'setup-direx)
