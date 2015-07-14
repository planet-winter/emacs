;; Setup Magit

;; enable globally
(add-hook 'magit-mode-hook 'magit-svn-mode)


;;To enable the mode in a particular repository use:
;;;cd /path/to/repository
;;;git config --add magit.extension svn
;;To enable the mode for all repositories use:
;;git config --global --add magit.extension svn

(provide 'setup-magit)
