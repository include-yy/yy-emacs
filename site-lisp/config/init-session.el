(require 'basic-toolkit)

(setq desktop-load-locked-desktop t) ; don't popup dialog ask user, load anyway
(setq desktop-restore-frames nil) ; don't restore any frame

(defun emacs-session-restore ()
  "restore emacs session"
  (interactive)
  (ignore-errors
    ;; Kill other windows
    (delete-other-windows)
    ;; Kill unused buffers
    (kill-unused-buffers)
    ;; restore session
    (desktop-read "~/.emacs.d")))

(defun emacs-session-save (&optional arg)
  "Save emacs session"
  (interactive "p")
  (ignore-errors
    (if (equal arg 4)
	;; kill all buffers if with prefix argument
	(mapc 'kill-buffer (buffer-list))
      ;; kill unused buffers
      (kill-unused-buffers)
      ;; save all buffers before exit
      (auto-save-buffers))
    ;; save session
    (make-directory "~/.emacs.d/" t)
    (desktop-save "~/.emacs.d/")
    ;; Exit emacs
    (kill-emacs)))

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-c <f12>") 'emacs-session-save)

(provide 'init-session)

;;; init-session.el ends here
