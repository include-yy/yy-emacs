;; terminal improvement
(when (not (display-graphic-p))
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

;; chinese input method imp
(global-set-key (kbd "C-x 【") 'backward-page)
(global-set-key (kbd "C-x 】") 'forward-page)

;; japanese input method imp
(global-set-key (kbd "C-x 「") 'backward-page)
(global-set-key (kbd "C-x 」") 'forward-page)
(global-set-key (kbd "M-ｘ") 'execute-extended-command)
(global-set-key (kbd "C-x ｂ") 'ido-switch-buffer)
(global-set-key (kbd "M-ｗ") 'kill-ring-save)
;; kill word
(defun my-kill-word-or-region (arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'my-kill-word-or-region)
(global-set-key (kbd "C-ｗ") 'my-kill-word-or-region)

;; search
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)

;; kill current buffer directly
(global-unset-key (kbd "C-x k"))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; use C-z other than C-x z to repeat command
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'repeat)

(provide 'init-key)

;;; init-key.el ends here
