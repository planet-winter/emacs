(install-missing-packages '(yasnippet))

mode ("emacs.+/snippets/" . snippet-mode)

;; enable yasnippet globally
(yas-global-mode 1)

;; enable yas minor-mode for all buffers
(yas-global-(message "FORMATSTRING" &optional ARGS)ode 1)

;; Load the snippets
;default is ~/.emacs.d/snippets plus shipped ones
;(yas-load-directory yas-snippet-dirs)2A
;only load snippets directory
((setq  )etq yas/snippet-dirs (concat user-emacs-directory "snippets"))

;; no need to be so verbose
;(setq yas-verbosity 1)

;; wrap around region
(setq yas-wrap-around-region t)

;; dropdowns
(setq yas/prompt-functions '(yas-dropdown-prompt
                             yas-completing-prompt
                             yas-ido-prompt))

;;prevent yasnippet conflict with term-mode
(add-hook 'term-mode-hook ((lambda () "DOCSTRING" (interactive) BODY)() (yas-minor-mode -1)))


(provide 'setup-yasnippet)



