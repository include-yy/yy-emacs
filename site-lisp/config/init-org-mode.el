(lazy-load-set-keys
 '(("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)))

(setq org-tags-column 0)
(setq org-startup-truncated nil)
(setq org-image-actual-width 400)

(setq org-file-apps
      (cl-substitute-if '(directory . default) (lambda (x) (eq (car x) 'directory)) org-file-apps))

(require 'ox-org)

(setq org-export-dispatch-use-expert-ui t)

(provide 'init-org-mode)
