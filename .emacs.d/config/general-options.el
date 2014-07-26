
; save desktop sessions
(desktop-save-mode 1)
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
               (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(setq desktop-path '("~/"))
(setq desktop-dirname "~/")
(setq desktop-base-file-name ".emacs-desktop")

(if (boundp 'desktop-auto-save-timeout)
  (setq desktop-auto-save-timeout (* 60 15)))

; auto save interval
(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 300)

; clean normal buffers not displayed for 3 days
(setq clean-buffer-list-delay-general 3)

; clean special buffers not displayed for 3 hours
(setq clean-buffer-list-delay-special (* 3 3600))

; enable wildcard open files
(setq find-file-wildcards t)

; delete seleted text when typing
(delete-selection-mode 1)

;; ; prefix buffernames with dir
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)

; suspress warnings
(setq warning-minimum-level :error)

; debug errors
(setq debug-on-error t)

; interation
(setq confirm-kill-emacs nil)
(fset 'yes-or-no-p 'y-or-n-p)

