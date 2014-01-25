;; truncate comint buffers after x lines
(setq comint-buffer-maximum-size 5000)
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(provide 'setup-comint)
