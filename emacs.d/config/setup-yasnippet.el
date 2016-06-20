;packages-install '(yasnippet )
mode ("emacs.+/snippets/" . snippet-mode)
;config
;; enable yasnippet globally
(yas-global-mode 1)
;; extra yasnipet configs

;; enable yas minor-mode for all buffers
(yas-global-(message "FORMATSTRING" &optional ARGS)ode 1)

;; Load the snippets
;default is ~/.emacs.d/snippets plus shipped ones
;(yas-load-directory yas-snippet-dirs)2A
;only load snippets directory
((setq  )etq yas/snippet-dirs (concat user-emacs-directory "snippets"))

;; dropdowns
;((setq  )etq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))
  
;; No need to be so verbose
;(setq yas-verbosity 1)
;
;; Wrap around region
(setq yas-wrap-around-region t)

(setq yas/prompt-functions '(yas-dropdown-prompt
                             yas-completing-prompt
                             yas-ido-prompt))

;;prevent yasnippet conflict with term-mode
(add-hook 'term-mode-hook ((lambda () "DOCSTRING" (interactive) BODY)() (yas-minor-mode -1)))


(provide 'setup-yasnippet)



