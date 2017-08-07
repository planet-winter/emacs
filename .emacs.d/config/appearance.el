;;; set basic appearance and theme

;; install themes
(defun init--install-packages ()
  (packages-install
   '(
	ample-theme
	solarized-theme))
  )

;; no bell...
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; highlight current line
(global-hl-line-mode 1)
;(set-face-background 'hl-line "green")

;; highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; blinking cursor
(blink-cursor-mode 1)

;; set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; default theme
(load-theme 'manoj-dark t)

;; don't defer screen updates when performing operations
(setq redisplay-dont-pause t)


(provide 'appearance)
