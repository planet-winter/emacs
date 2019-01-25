(packages-install '(
                    ansible
		    ansible-vault
                    yaml-mode))

(add-hook 'yaml-mode-hook '(lambda () (ansible 1)
			     (ansible-doc-mode 1)))


(setq ansible::vault-password-file "~/.vault_pass")

;;(global-set-key (kbd "C-c b") 'ansible::decrypt-buffer)
;;(global-set-key (kbd "C-c g") 'ansible::encrypt-buffer)


(add-hook 'ansible-hook 'ansible::auto-decrypt-encrypt)

(provide 'ansible-config)
