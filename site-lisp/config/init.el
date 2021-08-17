(let (
      ;; temporarily increase `gc-cons-threshold' to speed up boost
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))

  ;; define some boost directories for ease of migration
  (defvar yy-emacs-root-dir (file-truename "~/yy-emacs/site-lisp"))
  (defvar yy-emacs-config-dir (concat yy-emacs-root-dir "/config"))
  (defvar yy-emacs-extension-dir (concat yy-emacs-root-dir "/extensions"))
  (defvar yy-emacs-winbin-dir (concat yy-emacs-root-dir "/winbin"))

  (with-temp-message ""
    (require 'benchmark-init-modes)
    (require 'benchmark-init)
    (benchmark-init/activate)

    (require 'init-autoload)
    (require 'init-startup)
    (require 'init-generic)
    (require 'lazy-load)
    (require 'basic-toolkit)
    (require 'redo+)

    (require 'init-line-number)
    (require 'init-electric-pair)
    (require 'init-dired)
    (require 'init-ido)
    (require 'init-icomplete)
    (require 'init-comment)
    (require 'init-hipple-exp)
    (require 'init-cc-mode)
    (require 'init-search-replace)

    ;;(require 'init-disable-mouse)
    (require 'init-backup)
    (require 'init-auto-save)
    (require 'init-indent)
    (require 'init-highlight-parentheses)
    (require 'init-smex)
    (require 'init-session)
    (require 'init-windows)
    (require 'init-avy)
    (require 'init-ffip)
    (require 'init-ctags)
    ;;(require 'init-haskell)
    ;;(require 'init-irony)
    ;;(require 'init-ivy)
    (require 'init-key)
    (require 'init-cnfonts)
    (require 'init-app-launcher)
    (require 'init-org-mode)
    (require 'init-c-c++)
    (require 'init-rust)
    (require 'init-nov)

    ;; load later
    (run-with-idle-timer
     1 nil
     #'(lambda ()
	 (require 'init-company-mode)
	 (require 'init-yasnippet)
	 (message "Hello, world")
	 ))))

(provide 'init)

;;; init.el ends here
