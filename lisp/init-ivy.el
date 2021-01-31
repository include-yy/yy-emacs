;;; init-ivy.el --- ivy-mode config
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; copied from https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-ivy.el

;;; Code:

(ivy-mode 1)

(setq ivy-count-format "(%d/%d)")

(with-eval-after-load 'ivy
  ;; work around ivy issue.
  ;; @see https://github.com/abo-abo/swiper/issues/828
  (setq ivy-display-style 'fancy))
  
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
(global-set-key (kbd "C-h f") 'counsel-describe-function)

(provide 'init-ivy)

;;; init-ivy.el ends here