(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq cursor-type 'bar)

(setq inhibit-splash-screen 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

(setq-default make-backup-files nil)

