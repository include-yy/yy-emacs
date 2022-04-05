;;; init-company.el -*- lexical-binding:t; -*-
(require 'company)
(require 'company-tng)

(global-company-mode 1)

;; front-end configure
(setq company-mininum-prefix-length 3) ; 3 char to pop up menu
(setq company-idle-delay 0.2)          ; set pop-up delay to 0.2s
(setq company-echo-delay 0)            ; remove annoying blink
(setq company-require-match nil)       ; allow string don't match candidate words
(setq company-show-numbers t)          ; show candidates order number 1 ~ 9 and 0
(setq company-selection-wrap-around t) ; loop over candidates
(setq company-auto-commit nil) ; don't use auto-complete

;; Use the tab-and-go frontend
;; Allow TAB to select and complete at the same time
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
	company-pseudo-tooltip-frontend
	company-echo-metadata-frontend))

;;Customize company backends
(setq company-backends (delete 'company-bbdb company-backends))
(setq company-backends (delete 'company-oddmuse company-backends))

;; Don't downcase the returned candidate
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

;; Add `company-elisp' backend for elisp
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (require 'company-elisp)
              (if (and (listp company-backends) (member 'company-elisp company-backends))
                  company-backends
                (push 'company-elisp company-backends))))

;; Add yasnippet support for all company backends
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backands")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas)
	  (and (listp backend)
	       (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
	    '(:with company-yasnippet))))

(setq company-backends
      (mapcar #'company-mode/backend-with-yas  company-backends))

;; Set keymaps
(lazy-load-unset-keys
 '("TAB")
 company-mode-map)

(lazy-load-unset-keys
 '("M-p" "M-n" "C-m")
 company-active-map)

(lazy-load-set-keys
 '(
   ("TAB" . company-complete-selection)
   ("M-h" . company-complete-selection)
   ("M-H" . company-complete-common)
   ("M-w" . company-show-location)
   ("M-s" . company-search-candidates)
   ("M-S" . company-filter-candidates)
   ("M-n" . company-select-next)
   ("M-p" . company-select-previous)
   ("M-i" . yas-expand)
   )
 company-active-map)

;; add posframe support
(require 'posframe)
(require 'company-posframe)
(company-posframe-mode 1)
;;dont display annoying quickhelper
(setq company-posframe-quickhelp-delay nil)

(provide 'init-company-mode)

;;; init-company-mode ends here
