;;; .doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here

;; pretify symbols
;; (setq prettify-symbols-unprettify-at-point t)
;; (global-prettify-symbols-mode +1)


;; ===== web - js - css
(setq
  web-mode-markup-indent-offset 2
  web-mode-code-indent-offset 2
  web-mode-css-indent-offset 2
  css-indent-offset 2
  js-indent-level 2
  typescript-indent-level 2
  json-reformat:indent-width 2
  prettier-js-args '("--single-quote")
 )

(add-hook!
 js2-mode 'prettier-js-mode
 (add-hook 'before-save-hook #'refmt-before-save nil t)
 (add-hook 'js-mode-hook 'js2-minor-mode))

;; ===== org
(setq
  org-ellipsis " ▾ "
  ;; org-bullets-bullet-list '(" ")
  org-tags-column -80
  org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
  org-log-done 'time
 )

(add-hook! reason-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

