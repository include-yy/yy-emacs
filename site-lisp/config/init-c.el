;; add font-lock for c++ mode
(add-hook 'c++-mode-hook 'modern-c++-font-lock-mode)

;; irony -- improving the editing experience for the C, C++, OC
;; advised config
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
;; add hooks
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony: company-backend in init-company-mode.el

;; irony-eldoc
(add-hook 'irony-mode-hook 'irony-eldoc)

(provide 'init-c)

;;; init-c.el ends here
