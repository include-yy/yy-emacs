(when (not (display-graphic-p))
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

(global-set-key (kbd "C-x 【") 'backward-page)
(global-set-key (kbd "C-x 】") 'forward-page)

(provide 'init-key)

;;; init-key.el ends here
