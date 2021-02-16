;;; ### awesome-pair ###
(lazy-load-unset-keys
 '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
 awesome-pair-mode-map)

(defvar awesome-pair-key-alist nil)
(setq awesome-pair-key-alist
      '(
	;; move
	("M-n" . awesome-pair-jump-left)
	("M-p" . awesome-pair-open-round)
	;; insert symbol
	("%" . awesome-pair-match-paren) ; paren goto
	("(" . awesome-pair-open-round) ; smart (
	("[" . awesome-pair-open-bracket) ; smart [
	("{" . awesome-pair-open-curly) ; smart {
	(")" . awesome-pair-close-round) ; smart )
	("]" . awesome-pair-close-bracket) ; smart ]
	("}" . awesome-pair-close-curly) ; smart }
	("\"" . awesome-pair-double-quote) ; smart "
	("=" . awesome-pair-equal) ; smart =
	("SPC" . awesome-pair-space) ; smart Space
	;; delete
	("M-o" . awesome-pair-backward-delete) ; delete backward
	("C-d" . awesome-pair-forward-delete) ; delete forward
	("C-k" . awesome-pair-kill) ; kill forward
	;; sorround
	("M-\"" . awesome-pair-wrap-double-quote) ; use " " wrap object or jump out string
	("M-[" . awesome-pair-wrap-bracket) ; use [ ] to wrap
	("M-{" . awesome-pair-wrap-curly) ; use { } wrap object
	("M-(" . awesome-pair-wrap-round) ; use ( ) wrap object
	("M-)" . awesome-pair-unwrap) ; unwrap object
	;; jump out and newline
	("M-:" . awesome-pair-jump-out-pair-and-newline)
	))
(lazy-load-set-keys awesome-pair-key-alist awesome-pair-mode-map)


;;; ### ivy ###
(lazy-load-unset-keys '("C-x b") ivy-mode-map)
(lazy-load-unset-keys '("C-s" "C-h f") counsel-mode-map)

(lazy-load-set-keys
 '(("C-x b" . ivy-switch-buffer)) ivy-mode-map)
(lazy-load-set-keys
 '(("C-s" . counsel-grep-or-swiper)) counsel-mode-map)


(provide 'init-key)

;;; init-key.el ends here
