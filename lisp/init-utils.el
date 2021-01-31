;;; init-utils.el --- Elisp helper functions and commands
;;; -*- coding: utf-8; lexical-binding: t -*-
;;; Comment:

;; copied from https://github.com/redguardtoo/emacs.d/blob/322dc81055d01627904424c8c72f37d95fa286ea/lisp/init-utils.el

;;; Code:

(defun my-ensure (feature)
  "Make sure FEATURE is required"
  (unless (featurep feature)
    (condition-case nil
	(require feature)
      (error nil))))

(defun my-what-face (&optional position)
  "Show all faces at POSITION."
  (let* ((face (get-text-property (or position (point)) 'face)))
    (unless (keywordp (car-safe face)) (list face))))

(defvar my-load-user-customized-major-mode-hook t)

(defvar my-force-buffer-file-temp-p nil)
(defun is-buffer-file-temp ()
  "if (buffer-file-name) is nil or a temp file or HTML file converted from org file"
  (interactive)
  (let* ((f (buffer-file-name)) (rlt t))
    (cond
     ((not my-load-user-customized-major-mode-hook)
      (setq rlt t))
     ((and (buffer-name) (string-match "\\* Org SRc" (buffer-name)))
      (setq rlt nil))
     ((null f)
      (setq rlt t))
     ((string-match (concat "^" temporary-file-directory) f)
      (setq rlt t))
     ((and (string-match "\.html$" f)
	   (file-exists-p (replace-regexp-in-string "\.html$" ".org" f)))
      (setq rlt t))
     (my-force-buffer-file-temp-p
      (setq rlt t))
     (t
      (setq rlt nil)))
    rlt))
	   
(provide 'init-utils)
;;; init-utils.el ends here
