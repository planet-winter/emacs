;; Setup Tramp remote file editing

;;remote edit method is scp per default
(setq tramp-default-method "ssh")
;; problem with custom root promt
(setq tramp-shell-prompt-pattern ".+")
(setq password-cache-expiry nil)
(setq tramp-debug-buffer t)

(provide 'setup-tramp)
