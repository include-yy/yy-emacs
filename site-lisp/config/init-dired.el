(require 'dired)
(require 'dired-x)
(require 'dired-sidebar)

;; conflict with dired-sidebar
;;(require 'dired-details)
;;(require 'dired-details+)

;;; {{{Config for dired
(setq delete-by-moving-to-trash t)	 ; for safer deletion
(setq dired-recursive-copies 'always)	 ; allow recursive copy
(setq dired-recursive-deletes 'always)	 ; allow recursive delete dir
(setq dired-listing-switches "-al")	 ; set args to `ls'
;;(setq dired-details-hidden-string "")  ; hidden details string
(setq dired-omit-size-limit nil)	 ; unset limit of dired omit
(setq dired-dwim-target t)		 ; make dired guess target dir
(setq directory-free-space-args "-Pkh")	 ; options for free space

(lazy-load-set-keys
 '(("r" . find-file)) dired-mode-map)

;;; {{{Config for dired-sidebar
(push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
(push 'rotate-windows dired-sidebar-toggle-hidden-commands)

(setq dired-sidebar-subtree-line-prefix "__")
(setq dired-sidebar-theme 'ascii)
(setq dired-sidebar-use-term-integration t)
(setq dired-sidebar-use-custom-font t)

;; set key to on/off dir tree
(lazy-load-unset-keys '("C-x C-n"))
(lazy-load-set-keys '(("C-x C-n" . dired-sidebar-toggle-sidebar)))

(provide 'init-dired)

;;; init-dired.el ends here
