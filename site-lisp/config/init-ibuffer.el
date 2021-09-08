(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)

;; don't show summary
(setq ibuffer-display-summary nil)
;; open ibuffer in current window
(setq ibuffer-use-other-window nil)
;; don't show empty group
(setq ibuffer-show-empty-filter-groups nil)
;; enable cycle movement
(setq ibuffer-movement-cycle t)
;; filter's header line
(setq ibuffer-use-header-line t)
;; dispaly format

(require 'ibuffer-vc)

;; (setq ibuffer-formats
;;       '((mark modified read-only vc-status-mini " "
;;               (name 18 18 :left :elide)
;;               " "
;;               (size 9 -1 :right)
;;               " "
;;               (mode 16 16 :left :elide)
;;               " "
;;               (vc-status 16 16 :left)
;;               " "
;;               vc-relative-file)))

(provide 'init-ibuffer)
