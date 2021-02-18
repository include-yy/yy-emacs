(require 'dired)
(require 'dired-x)
(require 'dired-details)
(require 'dired-details+)

(setq delete-by-moving-to-trash t)      ; for safer deletion
(setq dired-recursive-copies 'always)   ; allow recursive copy
(setq dired-recursive-deletes 'always)  ; allow recursive delete dir
(setq dired-listing-switches "-al")     ; set args to `ls'
(setq dired-details-hidden-string "")   ; hidden details string
(setq dired-omit-size-limit nil)        ; unset limit of dired omit
(setq dired-dwim-target t)              ; make dired guess target dir
(setq directory-free-space-args "-Pkh") ; options for free space

(provide 'init-dired)

;;; init-dired.el ends here
