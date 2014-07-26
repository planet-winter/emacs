(require 'yasnippet)

;; Use only own snippets, do not use bundled ones
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;;; No dropdowns please, yas
;(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))
;
;;; No need to be so verbose
;(setq yas-verbosity 1)
;
;;; Wrap around region
;(setq yas-wrap-around-region t)

(provide 'setup-yasnippet)
