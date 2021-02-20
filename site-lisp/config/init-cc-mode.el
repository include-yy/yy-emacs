;; CC mode containing:
;; - C (c-mode)
;; - C++ (c++-mode)
;; - Objective-C (objc-mode)
;; - Java (java-mode)
;; - CORBA IDL (idl-mode)
;; - Pike (pike-mode)
;; - AWK (awk-mode)

;; It provides
;; - syntax-based indentation
;; - font locking
;; - etc.

;; do not use "gnu" style
(setq-default c-default-style
	      '((java-mode . "java")
		(awk-mode . "awk")
		(other . "linux")))

;; Do not check for old-style (K&R) function declarations;
;; this speed up indenting a lot
(setq c-recognize-knr-p nil)

;; 4 space offset
(setq c-basic-offset 4)

;; add to common-hook
(defun fix-c-indent-offset-according-to-syntax-context (key val)
  ;; remove the old element
  (setq c-offsets-alist (delq (assoc key c-offsets-alist) c-offsets-alist))
  ;; new value
  (add-to-list 'c-offsets-alist '(key . val)))
(defun my-common-cc-mode-setup ()
  "setup shared by all languages (java/groovy/c++/c ...)"
  ;; no electirc newine
  (setq c-auto-newline nil)
  ;; indent
  ;; google "C/C++/Java code indentation in Emacs" for more advanced skills
  ;; C code:
  ;;   if(1) // press ENTER here, zero means no indentation
  (fix-c-indent-offset-according-to-syntax-context 'substatement 0)
  ;;   void fn() // press ENTER here, zero means no indentation
  (fix-c-indent-offset-according-to-syntax-context 'func-decl-cont 0))

(add-hook 'c-mode-common-hook 'my-common-cc-mode-setup)

;; c/c++-mode config
(defun my-c-mode-setup ()
  "C/c++ only setup"
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
  ;; set header search dir
  (setq cc-search-directories '("." "/usr/include" "/usr/local/include/*" "../*/include"))
  ;; make #define be left-aligned
  (setq c-electric-pound-behavior (quote (alignleft))))
(add-hook 'c-mode-hook 'my-c-mode-setup)
(add-hook 'c++-mode-hook 'my-c-mode-setup)

(provide 'init-cc-mode)

;; init-cc-mode.el ends here
