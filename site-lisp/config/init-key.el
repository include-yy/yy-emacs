(when (not (display-graphic-p))
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

(provide 'init-key)

;;; init-key.el ends here
