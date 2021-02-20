(require 'yasnippet)

;; add my template path
(add-to-list `yas/root-directory
	     (concat yy-emacs-root-dir "/snippets"))

;; indent config
(setq yas-indent-line 'auto)
(setq yas-also-auto-indent-first-line nil)

(setq yas-wrap-around-region t) ; snippet $0 field expansion wraps around sl selected region
(setq yas-triggers-in-field t)  ; allow stacked expansion
(setq yas-snippet-revival t)    ; reactive snippet after undo/redo

;; turn off auto-fill for long code
(add-hook 'snippet-mode #'turn-off-auto-fill)

;; Faces
(set-face-attribute 'yas-field-highlight-face nil
		    :inherit 'highlight
		    :foreground nil :background nil
		    :box '(:color "dim gray" :line-width 1))

;; key bind for yas-insert-snippet
(lazy-load-set-keys
 '(("C-c \\" . yas-insert-snippet))
   yas-minor-mode-map)

(yas-global-mode 1)
(yas-minor-mode 1)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
