(setq comment-auto-fill-only-comments t) ; only auto-fill inside comments
(setq comment-multi-line t) ; insert new terminator or starter

;; set keys
(lazy-load-unset-keys '("M-;"))
(lazy-load-set-keys
 '(("M-;" . comment-dwim)
   ("r" . comment-or-uncomment-region)
   ("l" . comment-line)
   ("b" . comment-box))
 nil
 "M-;")

(provide 'init-comment)

;;; init-comment.el ends here
