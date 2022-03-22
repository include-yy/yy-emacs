;; terminal improvement
(when (not (display-graphic-p))
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

;; chinese input method imp
(global-set-key (kbd "C-x 【") 'backward-page)
(global-set-key (kbd "C-x 】") 'forward-page)

;; kill word
(defun my-kill-word-or-region (arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'my-kill-word-or-region)

;; search
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)

;; kill current buffer directly
(global-unset-key (kbd "C-x k"))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(provide 'init-key)

;;; init-key.el ends here
