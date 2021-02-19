(require 'icomplete-vertical)

(icomplete-mode 1)
(icomplete-vertical-mode 1)

(setq completion-styles '(partial-completion substring))
(setq completion-category-overrides '((file (styles basic substring))))
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

;; config for icomplete
(setq icomplete-hide-common-prefix nil) ; show full name
(setq icomplete-compute-delay 0)

(lazy-load-set-keys
 '(("<down>" . icomplete-forward-completions)
   ("C-n" . icomplete-forward-completions)
   ("<up>" . icomplete-backward-completions)
   ("C-p" . icomplete-backward-completions)
   ("C-v" . icomplete-vertical-toggle)
   ("RET" . icomplete-force-complete-and-exit))
 icomplete-minibuffer-map)

;; look nicer
(set-face-attribute 'icomplete-first-match nil
		    :background "#90EE90"
		    :box '(:color "dim gray" :line-width 1))
(provide 'init-icomplete)

;;; init-icomplete.el ends here
