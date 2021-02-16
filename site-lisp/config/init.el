(let (
      ;; temporarily increase `gc-cons-threshold' to speed up boost
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))

  ;; define some boost directories for ease of migration
  (defvar yy-emacs-root-dir (file-truename "~/yy-emacs/site-lisp"))
  (defvar yy-emacs-config-dir (concat yy-emacs-root-dir "/config"))
  (defvar yy-emacs-extension-dir (concat yy-emacs-root-dir "/extensions"))

  (require 'init-startup)
  (require 'init-generic)
  (require 'lazycat-theme)
  (lazycat-theme-load-with-sunrise)
  (require 'lazy-load)
  (require 'basic-toolkit)
  (require 'redo+)
  (require 'awesome-pair)
  (require 'display-line-numbers)
  (require 'highlight-parentheses)

  (require 'init-backup)
  (require 'init-auto-save)
  (require 'init-line-number)
  (require 'init-awesome-pair)
  (require 'init-awesome-tray)
  (require 'init-ivy)
  (require 'init-key)

  (run-with-idle-timer
   1 nil
   #'(lambda ()
       (require 'init-yasnippet)
       (require 'init-company-mode)

       ;; Restore session at last
       (require 'init-session)
       ;;(emacs-session-restore)
  )))


(provide 'init)

;;; init.el ends here
