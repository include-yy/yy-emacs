(lazy-load-unset-keys '("M-g g"))

(lazy-load-global-keys
 '(("C-;" . avy-goto-char)
   ("C-'" . avy-goto-char-2)
   ("M-g g" . avy-goto-line)
   ("M-g w" . avy-goto-word-1)
   ("M-g e" . avy-goto-word-0))
 "avy")

(provide 'init-avy)

;;; init-avy.el ends here
