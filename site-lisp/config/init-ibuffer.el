;;; init-ibuffer.el config ibuffer -*- lexical-binding:t; -*-
(require 'ibuffer)
(require 'ibuffer-vc)
;; use C-x C-b call ibuffer command
(global-unset-key (kbd "C-x C-b"))
;; don't open other window when in a Ibuffer
(defun init-ibuffer-ibuffer ()
  (interactive)
  (if (string= (buffer-name) "*Ibuffer*")
      (ibuffer-update nil t)
    (ibuffer)))
(global-set-key (kbd "C-x C-b") 'init-ibuffer-ibuffer)

;; ibuffer formats
;; see ibuffer.el
(setq ibuffer-formats
      '((mark modified read-only locked
              " " (name 18 18 :left :elide)
	      " " (size 9 -1 :right)
	      " " (mode 16 16 :left :elide)
	      " " filename-and-process)))

;; the ibuffer-vc
(push
 '(mark modified read-only vc-status-mini
	" " (name 18 18 :left :elide)
        " " (size 9 -1 :right)
        " " (mode 16 16 :left :elide)
        " " (vc-status 16 16 :left)
        " " vc-relative-file)
 ibuffer-formats)


;; ibuffer fontification-alist
;; just copy from ibuffer.el
(setq ibuffer-fontification-alist
      '((10 buffer-read-only font-lock-constant-face)
	(15 (and buffer-file-name
		 (string-match ibuffer-compressed-file-name-regexp
			       buffer-file-name))
	    font-lock-doc-face)
	(20 (string-match "^\\*" (buffer-name)) font-lock-keyword-face)
	(25 (and (string-match "^ " (buffer-name))
		 (null buffer-file-name))
	    italic)
	(30 (memq major-mode ibuffer-help-buffer-modes) font-lock-comment-face)
	(35 (derived-mode-p 'dired-mode) font-lock-function-name-face)
	(40 (and (boundp 'emacs-lock-mode) emacs-lock-mode) ibuffer-locked-buffer)))

;; don't use custom save
(setq ibuffer-save-with-custom nil)

;; saved filters
(let (it)
  ;; add push here
  (push '("el"
	  (or
	   (file-extension . "el")
	   (used-mode . emacs-lisp-mode)))
	it)
  (push '("cl"
	  (or
	   (used-mode . lisp-mode)
	   (file-extension . "lisp")))
	it)
  (push '("esrc"
	  (or
	   (file-extension . "el")
	   (directory . "emacs/.*/lisp")))
	it)
  (push '("org"
	  (or
	   (file-extension . "org")
	   (used-mode . org-mode)))
	it)
  ;; set option to it
  (setq ibuffer-saved-filters it)
  )

;; saved groups
(let (it)
  ;;add push here
  (push '("default"
	  ("clisp"
	   (saved . "cl"))
	  ("src"
	   (saved . "esrc"))
	  ("elisp"
	   (saved . "el"))
	  ("org"
	   (saved . "org")))
	it)
  ;;set option to it
  (setq ibuffer-saved-filter-groups it)
  )

;; switch to default group when start ibuffer
(defun init-ibuffer-use-default-group ()
  (and (not ibuffer-filter-groups) ;; not use group
       (assoc "default" ibuffer-saved-filter-groups)
       (ibuffer-switch-to-saved-filter-groups "default")))
(add-hook 'ibuffer-hook 'init-ibuffer-use-default-group)

;; functions used to save filter and group config code
(defmacro init-ibuffer-generate-saver (name var)
  `(defun ,name (name)
     (interactive
      (if (null ,var)
	  (error "No item saved")
	(list (completing-read "get group: " ,var nil t))))
     (insert (concat "(push '"
		     (pp-to-string (assoc name ,var))
		     " it)"))))
(init-ibuffer-generate-saver init-ibuffer-filter ibuffer-saved-filters)
(init-ibuffer-generate-saver init-ibuffer-group ibuffer-saved-filter-groups)

;; preds and regexps that buffer not show
(setq ibuffer-never-show-predicates '())

;; preds and regexps that buffer show
(setq ibuffer-always-show-predicates '())

;; major mode never mark by content
(setq ibuffer-never-search-content-mode '(dired-mode))

;; don't show empty filter groups
(setq ibuffer-show-empty-filter-groups nil)

;; use other windows ibuffer
(setq ibuffer-use-other-window t)

;; use full size ibuffer
(setq ibuffer-default-shrink-to-minimum-size nil)

;; don't show summary
(setq ibuffer-display-summary nil)

;; enable cycle movement
(setq ibuffer-movement-cycle t)

;;config for ibuffer-vc
;;copied from ibuffer-vc.el
(defun init-ibuffer-group-by-vc-and-default ()
  (interactive)
  (let* ((vc-res (ibuffer-vc-generate-filter-groups-by-vc-root))
	 (new-group (append vc-res (cdr (assoc "default" ibuffer-saved-filter-groups)))))
    (setq ibuffer-filter-groups new-group)
    (let ((ibuf (get-buffer "*Ibuffer*")))
      (when ibuf
        (with-current-buffer ibuf
          (pop-to-buffer ibuf)
          (ibuffer-update nil t))))))
(define-key ibuffer-mode-map (kbd "/ '") 'init-ibuffer-group-by-vc-and-default)

(provide 'init-ibuffer)
