;;; init-company.el --- complete anything mode config
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; copied from https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-company.el

;;; Code:

(add-hook 'after-init-hook 'global-company-mode)

(defvar my-company-zero-key-for-filter nil
  "If t, pressing 0 calls `company-filter-candidates' per company's status.")

(when (fboundp 'evil-declare-change-repeat)
  (mapc #'evil-declare-change-repeat
        '(company-complete-common
          company-select-next
          company-select-previous
          company-complete-selection
          company-complete-number)))

(with-eval-after-load 'company

  (defun my-company-number ()
    "Forward to `company-complete-number'.
Unless the number is potentially part of candidate.
In that case, insert the number."
    (interactive)
    (let* ((k (this-command-keys))
	   (re (concat "^" company-prefix k))
	   (n (if (equal k "0") 10 (string-to-number k))))
      (cond
       ((or (cl-find-if (lambda (s) (string-match re s)) company-candidates)
	    (> n (length company-candidates))
	    (looking-back "[0-9]+\\.[0-9]*" (line-beginning-position)))
	(self-insert-command 1))
       ((and (eq n 10) my-company-zero-key-for-filter)
	(company-filter-candidates))
       (t
	(company-complete-number)))))
  
  (company-statistics-mode)
  
  ;;copied from chen bin's config, but maybe i don't need them
  ;; ;;(push 'company-cmake company-backends)
  ;; ;;(push 'company-c-headers company-backends)
  
  ;; delete company-ropemacs, but I don't know why
  (setq company-backends (delete 'company-ropemacs company-backends))

  ;; Using digits to select company-mode candidates
  (let ((map company-active-map))
    (mapc
     (lambda (x)
       (define-key map (format "%d" x) 'my-company-number))
     (number-sequence 0 9)))

  (setq company-auto-commit t)
  ;; char "/ ) . , ;" to trigger auto commit
  (setq company-auto-commit-chars '(92 41 46 44 59))

  (setq company-dabbrev-downcase nil
	;; make previous/next selection in the popup cycles
	company-selection-wrap-around t
	;; case sensitive
	company-dabbrev-ignore-case nil
	;; press M-number to choose candidate
	company-show-numbers t
	company-idle-delay 0.2
	company-clang-insert-arguments nil
	company-require-match nil
	company-ctags-ignore-case t
	;; @see https://github.com/company-mode/company-mode/issues/146
	company-tooltip-align-annotations t)

  ;; Press SPACE will accept the highlighted candidates and insert a space
  ;; "M-x describe-variable company-auto-complete-chars for details.
  ;; So that's BAD idea
  (setq company-auto-complete nil)

  ;; Not to load company-mode for certain major modes
  (setq company-global-modes
        '(not
          eshell-mode
          comint-mode
          erc-mode
          gud-mode
          rcirc-mode
          minibuffer-inactive-mode)))

;; Not config company-ispell

(provide 'init-company)
;;; init-company.el ends here
