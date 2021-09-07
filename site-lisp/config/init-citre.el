(require 'citre)
(require 'citre-config)

(when (eq system-type 'windows-nt)
  (setq citre-readtags-program (concat yy-emacs-winbin-dir
				       "/readtags.exe")
	citre-ctags-program (concat yy-emacs-winbin-dir
				    "/ctags.exe")))

;; recommend key config
(define-key citre-mode-map
  (kbd "C-x c j") 'citre-jump)
(define-key citre-mode-map
  (kbd "C-x c J") 'citre-jump-back)
(define-key citre-mode-map
  (kbd "C-x c P") 'citre-ace-peek)
(define-key citre-mode-map
  (kbd "C-x c p") 'citre-peek)
(define-key citre-mode-map
  (kbd "C-x c u") 'citre-update-this-tags-file)

;; use project root, currently .git
(setq citre-use-project-root-when-creating-tags t)

(setq citre-auto-enable-citre-mode-modes
      '(prog-mode))

(provide 'init-citre)
