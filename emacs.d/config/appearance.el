;; set basic appearance and theme

;; no bell...
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Highlight current line
(global-hl-line-mode 0)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; higlight current line
(set-face-background 'hl-line "green")

;; Blinking cursor
(blink-cursor-mode 1)

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; Default theme
(load-theme 'manoj-dark t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)


(provide 'appearance)
