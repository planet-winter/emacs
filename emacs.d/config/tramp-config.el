;; Setup Tramp remote file editing

;;remote edit method is scp per default
(setq tramp-default-method "ssh")
;; problem with custom root promt
(setq tramp-shell-prompt-pattern ".+")
(setq password-cache-expiry nil)
(setq tramp-debug-buffer t)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
;; projectile does not go well togehter with tramp
(defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))
(provide 'tramp-config)
