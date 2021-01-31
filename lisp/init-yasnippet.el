;;; init-yasnippet.el --- config yasnippet mode
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; copyied from https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-yasnippet.el

;;; Code:
(setq my-yasnippets (expand-file-name "~/.emacs.d/my-yasnippets"))

(defun my-enable-yas-minor-mode ()
  "Enable `yas-minor-mode'."
  (unless (is-buffer-file-temp) (yas-minor-mode 1)))

(add-hook 'prog-mode-hook 'my-enable-yas-minor-mode)
(add-hook 'text-mode-hook 'my-enable-yas-minor-mode)

(defun my-yas-expand-from-trigger-key-hack (orig-func &rest args)
  "Tab key won't trigger yasnippet expand in org heading."
  (cond
   ;;skip yas expand in org heading
   ((and (eq major-mode 'org-mode)
	 (string-match "^org-level-" (format "%s" (my-what-face))))
    (org-cycle))
   (t
    (apply orig-func args))))

(advice-add  'yas-expand-from-trigger-key :around #'my-yas-expand-from-trigger-key-hack)

(defun my-yas-reload-all ()
  "Compile and reload snippets. Run the command after adding new snippets."
  (interactive)
  (yas-compile-directory (file-truename (concat my-emacs-d "snippets")))
  (yas-reload-all)
  (my-enable-yas-minor-mode))

(with-eval-after-load 'yasnippet
  ;; http://stackoverflow.com/questions/7619640/emacs-latex-yasnippet-why-are-newlines-inserted-after-a-snippet
  (setq-default mode-require-final-newline nil)
  ;; Use `yas-dropdown-prompt' if possible. It requires `dropdown-list'.
  (setq yas-prompt-functions '(yas-dropdown-prompt
			       yas-ido-prompt
			       yas-completing-prompt))

  ;; Use `yas-completing-prompt' when ONLY when "M-x yas-insert-snippet"
  ;; Thanks to capitaomorte for providing the trick.
  (defun my-yas-insert-snippet-hack (orig-func &rest args)
    "Use `yas-completing-prompt' for `yas-prompt-functions' but only here..."
    (let* ((yas-prompt-functions '(yas-completing-prompt)))
      (apply orig-func args)))
  (advice-add 'yas-insert-snippet :around #'my-yas-insert-snippet-hack)

  (when (and (file-exists-p my-yasnippets)
	     (not (member my-yasnippets yas-snippet-dirs)))
    (add-to-list 'yas-snippet-dirs my-yasnippets))

  (yas-reload-all))
					 
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
