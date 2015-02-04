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

(defun planet-show-today-list ()
  (interactive)
  (switch-to-buffer-other-window "todo.org.gpg")
  (org-match-sparse-tree t "@DAY")
)


(defun planet-org-alarm (min-to-app new-time txt)
  (let ((process-connection-type nil)))
  (save-window-excursion
    (shell-command (concat "/usr/bin/xmessage -center -name 'Message from Emacs' -geometry 400x200 '" txt "' &"))
  )
)
(setq appt-disp-window-function (function planet-org-alarm))

(defun planet-insert-weekdate ()
  (interactive)
  (insert (format-time-string "%V-%Y-%m-%d")))


;; global tags
(setq org-tag-persistent-alist '(("@DAY " . ?d)("@WEEK" . ?w)))

;; global todo states
(setq org-todo-keywords
       '((sequence "TODO" "NEXT" "STARTED" "WAITING" "|" "DONE" "CANCELED")))

(setq org-capture-templates
      (quote (("t" "todo" entry (file (concat org-directory "/todo.org.gpg")) "** TODO %? ")
              ("d" "todo today" entry (file (concat org-directory "/todo.org.gpg")) "** TODO %?    :@DAY:")
              ("w" "todo this week" entry (file (concat org-directory "/todo.org.gpg")) "** TODO %?    :@WEEK:")
              ("n" "next" entry (file (concat org-directory "/todo.org.gpg")) "** NEXT %?"))))


(provide 'setup-org)
