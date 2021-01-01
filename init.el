;;; init.el --- Load the full configuration
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; This file bootstraps the configuration, which is divided into
;; a number of files.

;;; Code

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;-----------------------------------------------------------------------------
;; Bootstrap config
;;-----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-elpa) ;;Machinery for installing required packages

;;-----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;-----------------------------------------------------------------------------
(require 'init-essential)
(require 'init-linum-mode)
(require 'init-misc)
(require 'init-lisp)

;;for temp used
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

(provide 'init)

;;; init.el ends here


