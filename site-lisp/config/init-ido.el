(require 'ido-vertical-mode)

(ido-mode 1)
(ido-vertical-mode 1)

;; config for ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere nil)

;; config for ido-vertical
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t) ; show count of candidates

;; config style
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background "#e5b7c0")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background "#e52b50"
                    :foreground "white")
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground "#b00000")


(provide 'init-ido)

;;; init-ido.el ends here
