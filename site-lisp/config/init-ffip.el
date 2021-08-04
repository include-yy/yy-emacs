;; on windows, use find copied from git's uer\bin, and rename to avoid
;; name conflict with dos's command FIND
(when (eq system-type 'windows-nt)
  (setq ffip-use-rust-fd t)
  (setq ffip-find-executable (concat yy-emacs-root-dir "/winbin/fd.exe")))

;; set key
(lazy-load-global-keys
 '(("C-c C-f" . find-file-in-project))
 "find-file-in-project")

(provide 'init-ffip)

;;; init-ffip.el ends here
