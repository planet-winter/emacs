(package-initialize)

(install-missing-packages '(elpy))

(add-to-list 'auto-mode-alist '("\\.py$" . elpy-mode))

(elpy-enable)
