;;; essential.el --- Some basic configurations
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;;; Code:

;;-----------------------------------------------------------------------------
;; Suppress GUI fratures
;;-----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;;indicate empty lines
(setq indicate-empty-lines t)

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (horizontal-scroll-bar-mode -1))

;;no menu bar
(menu-bar-mode -1)

;;-----------------------------------------------------------------------------
;; Write backup files to its own directory
;; copied from https://github.com/redguardtoo/emacs.d/blob/c475caa35c3a29f4f2d51785c354a4090d547a89/lisp/init-essential.el
;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Auto_002dsave-and-Backup.html
;;-----------------------------------------------------------------------------
(defvar my-binary-file-name-regexp
  "\\.\\(avi\\|wav\\|pdf\\|mp[34g]\\|mkv\\|exe\\|3gp\\|rmvb\\|rm\\|pyim\\|\\.recentf\\)$"
  "Is binary file name?")

(setq backup-enable-predicate
      (lambda (name)
	(and (normal-backup-enable-predicate name)
	     (not (string-match-p my-binary-file-name-regexp name)))))

(let* ((backup-dir (expand-file-name "~/.backups")))
  (unless (file-exists-p backup-dir) (make-directory backup-dir))
  (setq backup-by-copying t
	backup-directory-alist (list (cons "." backup-dir))
	delete-old-versions t
	version-control t
	kept-new-versions 8
	kept-old-versions 4))

(setq vc-make-backup-files nil)

;;-----------------------------------------------------------------------------
;; Use visual-bell instead of noisy voice
;; copied from https://emacs.stackexchange.com/questions/28906/how-to-switch-off-the-sounds#:~:text=Turn%20off%20the%20bell%2C%20use,flash%20instead%20of%20a%20sound.
;; -----------------------------------------------------------------------------
(defun my-mode-line-visual-bell--flash ()
  (let ((frame (selected-frame)))
    (run-with-timer
     0.1 nil
     #'(lambda (frame)
         (let ((inhibit-quit)
               (inhibit-redisplay t))
           (invert-face 'header-line frame)
           (invert-face 'header-line-highlight frame)
           (invert-face 'mode-line frame)
           (invert-face 'mode-line-inactive frame)))
     frame)
    (let ((inhibit-quit)
          (inhibit-redisplay t))
      (invert-face 'header-line frame)
      (invert-face 'header-line-highlight frame)
      (invert-face 'mode-line frame)
      (invert-face 'mode-line-inactive frame))))

(setq visible-bell nil)
(setq ring-bell-function 'my-mode-line-visual-bell--flash)

;;-----------------------------------------------------------------------------
;; Nicer naming of buffers for files with identical names
;; copied from github.com/redguardtoo/emacs.d/lisp/init-essential.el, 2020/1/1, utc+8
;;-----------------------------------------------------------------------------

(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))
(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'init-essential)


;;; init-essential.el ends here
