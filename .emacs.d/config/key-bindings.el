(global-set-key "\M-+" 'enlarge-window)
(global-set-key "\M--" 'shrink-window)
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key [f1] 'magit-status)
(global-set-key [f8] 'org-capture)
(global-set-key "\C-xts" 'planet-show-started-list)
(global-set-key "\C-xtt" 'planet-show-todo-list)
(global-set-key "\C-xtw" 'planet-show-waiting-list)
(global-set-key "\C-xtx" 'planet-show-next-list)


(provide 'key-bindings)
