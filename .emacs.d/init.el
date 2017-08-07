;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez neeei
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq planet-extensions-lisp-dir
     (expand-file-name "extensions" user-emacs-directory))

;; Set path to config
(setq planet-config-dir
     (expand-file-name "config" user-emacs-directory))

;; Set path to setup
(setq planet-setup-dir
     (expand-file-name "setup" user-emacs-directory))

;; Set up load path
;;(add-to-list 'load-path user-emacs-directory) ;; do not add .emacs.d to load path again
(add-to-list 'load-path planet-extensions-lisp-dir)
(add-to-list 'load-path planet-config-dir)
(add-to-list 'load-path planet-setup-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files planet-extensions-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Setup packages from MELPA
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     ;git-commit-mode ;; not available f23
     ample-theme
     ansible
     ansible-doc
     auto-complete
     auto-virtualenv
     browse-kill-ring
     cider
     company-ansible
     crappy-jsp-mode
     css-eldoc
     flx
     flx-ido
     flycheck
     gist ; breaks on RHEL7
     gitconfig-mode
     gitignore-mode
     groovy-mode
     guide-key
     highlight-escape-sequences
     htmlize
     ido-at-point
     ido-vertical-mode
     magit ; breaks on RHEL7
     magit-svn ; breaks on RHEL7
     markdown-mode+
     move-text
     nodejs-repl
     paredit
     perspective
     projectile
     restclient
     rhtml-mode
     shell-command
     simple-httpd
     smartparens
     smex
     smooth-scrolling
     solarized-theme
     undo-tree
     virtualenvwrapper
     visual-regexp
     whitespace-cleanup-mode
     yasnippet
     zenburn-theme
     ztree
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
(eval-after-load 'org '(require 'org-config))
(eval-after-load 'shell '(require 'shell-config))
;(require 'yasnippet-config)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode)
  (add-hook it 'turn-on-smartparens-mode)))

;; language specific setup files
;(eval-after-load 'markdown-mode '(require 'markdown-config))

;; load stuff on demand
(autoload 'flycheck-mode "flycheck-config" nil t)
(autoload 'auto-complete-mode "auto-complete" nil t)

;; map files to modes
(require 'mode-mappings)

;; highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)


;; smart M-x is smart
(require 'smex)
(smex-initialize)


;; ido mode
(ido-mode)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
; easier throw away buffer creation
(setq ido-create-new-buffer 'always)
(ido-mode 1)

;; ansible
(require 'ansible-config)

;; key bindings
(require 'key-bindings)

;; general options
(require 'general-options)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))


;; conclude init by setting up specifics for the current user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
