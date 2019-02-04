
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(ansi-color-names-vector
     ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
  '(company-dabbrev-code-modes
     (quote
       (prog-mode batch-file-mode csharp-mode css-mode erlang-mode haskell-mode jde-mode lua-mode python-mode js-mode html-mode web-mode)))
 '(company-dabbrev-code-time-limit 0.5)
 '(company-dabbrev-time-limit 0.5)
  '(custom-safe-themes
     (quote
       ("dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "2ba560f0343b6534a0ea3a712afa5921e7e2f8ee25b6ced4cdedf4833262ce75" "e50aad2dcfeea1da0a01e0ae6fcbf99b6ced3fa5edbb78bbed7f488fa9947ac1" "1ae686197ad62af6ad7628251b2d743bdab0af90eb5ace3a8b405720492491d4" "415f209fd94b6f4440cc4f6919e714391bbbbb6a597961b7c5d7e1088e5f1e37" "e50dff3db34965ac308be9a9d50606bfc21a8b180f091918ffba80a37c6bb289" "7b878156f13964c3591ac3038ec89293af5ef56ae93cb1711e05feb6682f2725" "316e5edbf4777f93ccb0c9a0455bcb1d1fcdc19011a4df534cfc33d8ea91d5d2" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "d507c9e58cb0eb8508e15c8fedc2d4e0b119123fab0546c5fd30cadd3705ac86" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "1c57936ffb459ad3de4f2abbc39ef29bfb109eade28405fa72734df1bc252c13" "ffe39e540469ef05808ab4b75055cc81266875fa4a0d9e89c2fec1da7a6354f3" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "764e3a6472a3a4821d929cdbd786e759fab6ef6c2081884fca45f1e1e3077d1d" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "96efbabfb6516f7375cdf85e7781fe7b7249b6e8114676d65337a1ffe78b78d9" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "0ed3d96a506b89c1029a1ed904b11b5adcebeb2e0c16098c99c0ad95cb124729" "b6c43bb2aea78890cf6bd4a970e6e0277d2daf0075272817ea8bb53f9c6a7f0a" "25f330cb050c7e7ec402af1b60243e8185a7837b455af0fa026593d4f48a78b2" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "b1fdbb009af22a58788857cc5d44a4835a38088492ff0f3fea40857338cf0c3b" "7fbb8d064286706fb1e319c9d3c0a8eafc2efe6b19380aae9734c228b05350ae" "dc77fb4e02417a6a932599168bd61927f6f2fe4fe3dbc4e4086a0bfb25babd67" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d8a4e35ee1b219ccb8a8c15cdfed687fcc9d467c9c8b9b93bd25229b026e4703" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(fci-rule-color "#5B6268")
 '(flycheck-mode-line (quote (:eval (my/flycheck-mode-line-status-text))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
  '(package-selected-packages
     (quote
       (ox-hugo go-mode go-projectile ansi yafolding helm-flx markdown-mode+ company-tern helm-orgcard challenger-deep-theme kotlin-mode el-get html-to-markdown org-plus-contrib jekyll-modes ob-restclient restclient markdown-mode yaml-mode doom-themes org-mime znc zenburn-theme web-mode undo-tree tern spaces spacegray-theme smooth-scrolling smex smartparens smart-mode-line skewer-mode req-package rainbow-mode puppet-mode projectile pdf-tools paradox pallet ox-reveal org-bullets magit json-mode jedi ix interleave indent-guide ido-vertical-mode ido-ubiquitous ido-at-point hungry-delete highlight-symbol heroku-theme guide-key git-timemachine git-messenger gist flycheck flx-ido expand-region erc-hl-nicks emmet-mode elpy editorconfig discover-js2-refactor direx dash-at-point color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized buffer-move browse-kill-ring anti-zenburn-theme ample-theme ag adaptive-wrap ace-jump-mode)))
 '(paradox-automatically-star nil)
 '(paradox-github-token t)
 '(shr-color-visible-distance-min 40)
 '(shr-color-visible-luminance-min 180)
 '(vc-annotate-background "#1B2229")
  '(vc-annotate-color-map
     (list
       (cons 20 "#98be65")
       (cons 40 "#b4be6c")
       (cons 60 "#d0be73")
       (cons 80 "#ECBE7B")
       (cons 100 "#e6ab6a")
       (cons 120 "#e09859")
       (cons 140 "#da8548")
       (cons 160 "#d38079")
       (cons 180 "#cc7cab")
       (cons 200 "#c678dd")
       (cons 220 "#d974b7")
       (cons 240 "#ec7091")
       (cons 260 "#ff6c6b")
       (cons 280 "#cf6162")
       (cons 300 "#9f585a")
       (cons 320 "#6f4e52")
       (cons 340 "#5B6268")
       (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(erc-pal-face ((t (:inverse-video t)))))
