(setq org-directory "~/org")

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(setq org-agenda-files '("~/org/"))

(defun planet-show-todo-list ()
  (interactive)
  (org-todo-list nil)
  (next-multiframe-window)
  (enlarge-window 10)
)


(defun planet-show-waiting-list ()
  (interactive)
  (org-todo-list "WAITING")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun planet-show-next-list ()
  (interactive)
  (org-todo-list "NEXT")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun planet-show-started-list ()
  (interactive)
  (org-todo-list "STARTED")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun isg-org-alarm (min-to-app new-time txt)
  (let ((process-connection-type nil)))
  (save-window-excursion
    (shell-command (concat "/usr/bin/xmessage -center -name 'Message from Emacs' -geometry 400x200 '" txt "' &"))
  )
)
(setq appt-disp-window-function (function isg-org-alarm))


(setq org-capture-templates (quote (("t" "todo" entry (file "~/org/todo.org") "** TODO %? ")
                                    ("p" "project" entry (file "~/org/projekte.org") "** %?")
                                    ("s" "started" entry (file "~/org/todo.org") "** STARTED %?")
                                    ("n" "next" entry (file "~/org/todo.org") "** NEXT %?"))))



(provide 'setup-org)
