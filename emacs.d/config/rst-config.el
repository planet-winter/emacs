
;; setup RestructuredText for shpinx

packages-install '(
                   rst-mode )

(setq auto-mode-alist
      (append '(("\\.txt\\'" . rst-mode)
                ("\\.rst\\'" . rst-mode)
                ("\\.rest\\'" . rst-mode)) auto-mode-alist))

;; adornments
((35 over-and-under 0) ; ?#
 (42 over-and-under 0) ; ?*
 (61 simple 0) ; ?=
 (45 simple 0) ; ?-
 (94 simple 0) ; ?^
 (34 simple 0)) ; ?"

;; syntax check on save
(defun rst-validate-buffer ()
  "Tests to see if buffer is valid reStructured Text."
  (interactive)
  (if (eq major-mode 'rst-mode)         ; only runs in rst-mode
      (let ((name (buffer-name))
            (filename (buffer-file-name)))
        (cond
         ((not (file-exists-p "/usr/bin/rst2pseudoxml")) ; check that the program used to process file is present
          (error "Docutils programs not available."))
         ((not (file-exists-p filename)) ; check that the file of the buffer exists
          (error "Buffer '%s' is not visiting a file!" name))
         (t                             ; ok, process the file, producing pseudoxml output
          (let* ((pseudoxml (split-string (shell-command-to-string (concat "rst2pseudoxml " filename)) "\n"))
                 (firstline (car pseudoxml)) ; take first line of output
                 (lastline (nth (- (length pseudoxml) 2) pseudoxml))) ; take last line of output text
            (if (or (string-match "ERROR/" firstline)
                    (string-match "WARNING/" firstline)
                    ;; for reasons I don't understand, sometimes the warnings/errors are at the end of output
                    (string-match "ERROR/" lastline)
                    (string-match "WARNING/" lastline))
                (progn (ding)
                       (message "There's an problem in this buffer."))
              (message "Buffer is valid reStructured Text."))))))))

(add-hook 'rst-mode-hook
          (lambda()
            (add-hook 'after-save-hook 'rst-validate-buffer)))


(provide 'setup-rst)
