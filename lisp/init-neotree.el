;;; init-neotree.el --- neotree config
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Comment:

;; partly copied from https://github.com/adamw/emacs-config/blob/master/config/init-neotree.el

;;; Code:

(setq neo-window-position 'left)
(setq neo-theme 'arrow)

(setq neo-confirm-create-file 'y-or-n-p)
(setq neo-confirm-create-directory 'y-or-n-p)


(global-set-key (kbd "<f8>") 'neotree-toggle)
(provide 'init-neotree)
;;; init-neotree.el ends here
