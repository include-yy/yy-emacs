;;; init-misc.el --- Miscellaneous config
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;;; Code

;; {{ recentf-mode
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-max-saved-items 100)
(setq recentf-exclude '("/tmp/"
			"/ssh:"
			"/sudo:"
			"recentf$"
			"company-statistics-cache\\.el$"
			;; binary
			"\\.mkv$"
			"\\.mp[34]$"
			"\\.avi$"
			"\\.wav$"
			"\\.docx?$"
			"\\.xlsx?$"
			;;sub-titles
			"\\.sub$"
			"\\.srt$"
			"\\.ass$"))
;; }}


;; {{ auto-yasnippet
;; Use C-q instead tab to complete snippet
;; - `aya-create' at first, input ~ to mark the thing next
;; - `aya-expand' to expand snippet
;; - `aya-open-line' to finish
(global-set-key (kbd "C-q") #'aya-open-line)
;; }}
(provide 'init-misc)
;;; init-misc.el ends here

