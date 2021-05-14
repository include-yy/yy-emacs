;; Restore emacs session
(setq initial-buffer-choice t)
;;(run-with-timer 1 nil #'(lambda () (bury-buffer)))

;; improve performance of long line process
(setq bidi-inhibit-bpa t)
(setq-default bidi-paragraph-direction 'left-to-right)

;; improve I/O performance
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

(fset 'yes-or-no-p 'y-or-n-p) ; use y/n for yes/no
(when (display-graphic-p)
  (tool-bar-mode -1)      ; ban tool bar
  (scroll-bar-mode -1))   ; ban scroll bar

(menu-bar-mode -1)      ; ban menu bar
(blink-cursor-mode -1)  ; make cursor no blink
(transient-mark-mode 1) ; mark highlight
(global-subword-mode 1) ; Support FooBar format for Word movement

(setq use-dialog-box nil)               ; never pop dialog
(setq inhibit-startup-screen t)         ; inhibit start screen
(setq initial-scratch-message "")       ; switch off creating block buffer
(setq ring-bell-function 'ignore)       ; close noisy ring
(setq mouse-yank-at-point t)            ; to yank at point
(setq x-select-enable-clipboard t)      ; support paste with copy/outer program
(setq split-width-threshold nil)        ; split window vertically
(setq inhibit-compacting-font-caches t) ; use font cache to avoid ka
(setq confirm-kill-processes nil)       ; auto kill process when exiting
(setq ad-redefinition-action 'accept)   ; discard annoying redefine warning
(setq frame-resize-pixelwise t)         ; set resize mode
(setq-default comment-style 'indent)    ; config auto-indent comment style
(setq-default major-mode 'text-mode)    ; set default major mode to text mode

;;(setq async-bytecomp-allowed-packages nil) ; avoid errors message of magit
;;(setq word-wrap-by-catory t) ; wrap line according to chinese

;; make scroll smoothly
(setq scroll-step 1
      scroll-conservatively 10000)

;; don't show *scratch*
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; don't ask me when close emacs with running process
(defadvice save-buffer-kill-emacs (around no-query-kill-emacs activate)
  "prevent annoying \"Active processes exist\" query when you quit emacs"
  (require 'noflet)
  (noflet ((process-list ())) ad-do-it))

;; Don't ask me when kill process buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
	    kill-buffer-query-functions))

;; Nicer naming of buffers for files with identical names
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-generic)

;;; init-generic.el ends here
