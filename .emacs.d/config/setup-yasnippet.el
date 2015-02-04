(require 'yasnippet)

;; enable yas minor-mode for all buffers
(yas-global-mode 1)

;; Load the snippets
(yas/load-directory yas-snippet-dirs)

;;; No dropdowns please, yas
;(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))
;
;;; No need to be so verbose
;(setq yas-verbosity 1)
;
;;; Wrap around region
;(setq yas-wrap-around-region t)

(provide 'setup-yasnippet)
