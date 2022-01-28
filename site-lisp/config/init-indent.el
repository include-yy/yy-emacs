(require 'indent-guide)
(require 'aggressive-indent)

(setq-default indent-tabs-mode t)	; use tab indent
(setq-default tab-width 8)		; the normal tab width
(setq-default standard-indent 4)	; just the default value

;; it is open by default
(electric-indent-mode 1)

;;; {{{ indent-guide mode config
(indent-guide-global-mode)

(setq indent-guide-recursive t) ; draw multiple lines
(setq indent-guide-threshold 0) ; avoid zero-column guide line
(setq indent-guide-delay 0.1)     ; show lines immediately

;; use `ident-guide-char' to show indent
;; │ ┃  ▍ ┇ ┋ ┊ ┆ ╽ ╿
;;(setq indent-guide-char "┊")


;;; {{{ aggressive-indent mode config
(global-aggressive-indent-mode 1)

(setq aggressive-indent-sit-for-time 0.1) ; set reasonate time

;; don't use agg for these modes
(dolist (mmod '(
		python-mode
		lua-mode
		snippet-mode
		verilog-mode))
  (add-to-list 'aggressive-indent-excluded-modes mmod))

;; don't use electric indent mode in these modes
(dolist (mmod '(
		python-mode
		))
  (add-to-list 'aggressive-indent-dont-electric-modes mmod))

;; The variable `aggressive-indent-dont-indent-if' lets you customize when you
;; **don't** want indentation to happen.  For instance, if you think it's
;; annoying that lines jump around in `c++-mode' because you haven't typed the
;; `;' yet, you could add the following clause:
(add-to-list 'aggressive-indent-dont-indent-if
             '(and (or (derived-mode-p 'c++-mode)
		       (derived-mode-p 'c-mode))
                   (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                       (thing-at-point 'line)))))

(add-hook 'prog-mode-hook
	  '(lambda ()
	     (unless (or (member major-mode aggressive-indent-excluded-modes)
			 (member major-mode aggressive-indent-dont-electric-modes))
	       (aggressive-indent-mode))))

(provide 'init-indent)

;;; init-indent.el ends here
