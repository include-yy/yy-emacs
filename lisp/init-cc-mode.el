;;; init-cc-mode.el --- cc-mode config
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; copied from https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-cc-mode.el

;;; Code:

;; avoid default "gnu" style, use more popular one
(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

(defun fix-c-indent-offset-according-to-syntax-context (key val)
  ;; remove the old element
  (setq c-offsets-alist (delq (assoc key c-offsets-alist) c-offsets-alist))
  ;; new value
  (add-to-list 'c-offsets-alist '(key . val)))
(setq-default c-basic-offset 4)

(defun my-common-cc-mode-setup ()
  "setup shared by all language (java/c++ ...)"
  ;;NO newline automatically after electric expressions are entered
  (setq c-auto-newline nil)

  ;; syntax-highlight aggressively
  ;; (setq font-lock-support-mode 'lazy-lock-mode)
  (setq lazy-lock-defer-contextually t)
  (setq lazy-lock-defer-time 0)

  ;;DEL all previous whitespace
  (c-toggle-hungry-state 1)

  ;; indent
  ;; google "C/C++/Java code indentation in Emacs" for more advanced skills
  ;; C code:
  ;;   if(1) // press ENTER here, zero means no indentation
  (fix-c-indent-offset-according-to-syntax-context 'substatement 0)
  ;;   void fn() // press ENTER here, zero means no indentation
  (fix-c-indent-offset-according-to-syntax-context 'func-decl-cont 0))

(defun my-c-mode-setup ()
  "C/C++ only setup"
  ;; @see http://stackoverflow.com/questions/3509919/ \
  ;; emacs-c-opening-corresponding-header-file
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file)

  ;; make a #define be left-aligned
  (setq c-electric-pound-behavior (quote (alignleft))))


(defun c-mode-common-hook-setup ()
  (unless (is-buffer-file-temp)
    (my-common-cc-mode-setup)
    (unless (or (derived-mode-p 'java-mode) (derived-mode-p 'groovy-mode))
      (my-c-mode-setup))

    (when (and (executable-find "global")
	       (not (string-match-p "GTAGS not found"
				    (shell-command-to-string "global -p"))))
      (eldoc-mode 1))))

(add-hook 'c-mode-common-hook 'c-mode-common-hook-setup)

(provide 'init-cc-mode)
;;; init-cc-mode ends here
