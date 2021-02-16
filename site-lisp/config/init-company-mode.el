(add-hook 'prog-mode-hook
	  '(lambda ()
	     (require 'lazy-load)
	     (require 'company)
	     (require 'company-yasnippet)
	     (require 'company-dabbrev)
	     (require 'company-files)
	     (require 'company-tng)

	     ;; config for company mode
	     (setq company-idle-delay 0.2) ; set the completion menu pop-up delay
	     (setq company-minimum-prefix-length 3) ; pop up a completion menu by tapping 3 character
	     (setq company-show-numbers t) ; do not display numbers on the left
	     (setq company-require-match nil) ; allow string don't match candidate words

	     (setq company-backends (delete 'company-bbdb company-backends))
	     (setq company-backends (delete 'company-eclim company-backends))
	     (setq company-backends (delete 'company-gtags company-backends))
	     (setq company-backends (delete 'comapny-etags company-backends))
	     (setq company-backends (delete 'company-oddmuse company-backends))
	     (add-to-list 'company-backends 'company-files)

	     ;; Use the tab-and-go frontend
	     ;; Allow TAB to select and complete at the same time
	     (company-tng-configure-default)
	     (setq company-frontends
		   '(company-tng-frontend
		     company-pseudo-tooltip-frontend
		     company-echo-metadata-frontend))

	     ;; enable global
	     (global-company-mode)

	     ;; Don't downcase the returned candidate
	     (setq company-dabbrev-downcase nil)
	     (setq company-dabbrev-ignore-case t)

	     ;; Add `company-elisp' backend for elisp
	     (add-hook 'emacs-lisp-mode-hook
		       '(lambda ()
			  (require 'company-elisp)
			  (push 'company-elisp company-backends)))

	     (lazy-load-unset-keys '("TAB") company-mode-map)
	     (lazy-load-unset-keys '("M-p" "M-n" "C-m") company-active-map)

	     (lazy-load-set-keys
	      '(("TAB" . company-complete-selection)
		("M-h" . company-complete-selection)
		("M-H" . company-complete-common)
		("M-w" . company-show-location)
		("M-s" . company-search-candidates)
		("M-S" . company-filter-candidates)
		("M-n" . company-select-next)
		("M-p" . company-select-previous)
		("M-i" . yas-expand))
	      company-active-map)

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

	     (setq company-backends (mapcar #'company-mode/backend-with-yas  company-backends))))

(provide 'init-company-mode)

