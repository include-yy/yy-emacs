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
(with-eval-after-load 'company
  (add-to-list 'company-backends
	       '(company-irony :with company-yasnippet)))

;; irony-eldoc
(add-hook 'irony-mode-hook 'irony-eldoc)

(provide 'init-irony)

;;; init-c.el ends here
