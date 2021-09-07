;; terminal improvement
(when (not (display-graphic-p))
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

;; chinese input method imp
(global-set-key (kbd "C-x 【") 'backward-page)
(global-set-key (kbd "C-x 】") 'forward-page)

;; kill word
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; search
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)

(provide 'init-key)

;;; init-key.el ends here
