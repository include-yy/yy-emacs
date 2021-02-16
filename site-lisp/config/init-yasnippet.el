(add-hook 'prog-mode-hook
	  '(lambda ()
	     (require 'yasnippet)

	     (add-to-list `yas/root-directory
			  (concat yy-emacs-root-dir "/snippets"))
	     (yas-global-mode 1)

	     ;; Diable yasnippet mode on some mode
	     (dolist (hook (list
			    'term-mode-hook
			    ))
	       (add-hook hook '(lambda () (yas-minor-mode -1))))
	     ))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
