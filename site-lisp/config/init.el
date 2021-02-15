

(let (
      ;; temporarily increase `gc-cons-threshold' to speed up boost
      )

  ;; define some boost directories for ease of migration
  (defvar yy-emacs-root-dir (file-truename "~/yy-emacs/site-lisp"))
  (defvar yy-emacs-config-dir (concat yy-emacs-root-dir "/config"))
  (defvar yy-emacs-extension-dir (concat yy-emacs-root-dir "extensions"))
  
  (require 'init-auto-save))

(provide 'init)