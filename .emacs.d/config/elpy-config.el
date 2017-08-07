(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)
(packages-install '(elpy))

(add-to-list 'auto-mode-alist '("\\.py$" . elpy-mode))

;; set shorthand for virtualenv activcation
(defalias 'workon 'pyvenv-workon)


(elpy-enable)

(provide 'elpy-config)
