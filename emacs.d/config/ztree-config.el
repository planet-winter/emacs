;; ztree
;;  diff directories
(push (substitute-in-file-name "path-to-ztree-directory") load-path)
(require 'ztree)

(provide 'setup-ztree)
