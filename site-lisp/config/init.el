(let (
      ;; temporarily increase `gc-cons-threshold' to speed up boost
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))

  ;; define some boost directories for ease of migration
  (defvar yy-emacs-root-dir (file-truename "~/yy-emacs/site-lisp"))
  (defvar yy-emacs-config-dir (concat yy-emacs-root-dir "/config"))
  (defvar yy-emacs-extension-dir (concat yy-emacs-root-dir "/extensions"))

  (require 'benchmark-init-modes)
  (require 'benchmark-init)
  (benchmark-init/activate)

  (require 'init-startup)
  (require 'init-generic)
  (require 'lazy-load)
  (require 'basic-toolkit)
  (require 'redo+)

  ;;(require 'init-disable-mouse)
  (require 'init-hipple-exp)
  (require 'init-backup)
  (require 'init-auto-save)
  (require 'init-line-number)
  (require 'init-highlight-parentheses)
  (require 'init-smex)
  (require 'init-session)
  (require 'init-windows)

  ;;(require 'init-company-mode)
  ;;(require 'init-yasnippet)
  ;;(require 'init-ivy)
  ;;(require 'init-key)

  (run-with-idle-timer
   1 nil
   #'(lambda ()
       (message "Hello")
  )))


(provide 'init)

;;; init.el ends here
