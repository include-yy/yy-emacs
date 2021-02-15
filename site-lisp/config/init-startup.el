(tool-bar-mode -1) ;;ban tool bar
(menu-bar-mode -1) ;;ban menu bar
(scroll-bar-mode -1) ;; ban scroll bar

(when nil
  (if (featurep 'cocoa)
      (progn
	;; copied form lazy-cat's config, to solve mac's fullscreen problem
	(setq ns-use-native-fullscreen nil)
	(setq ns-use-fullscreen-animation nil)

	(set-frame-parameter (selected-frame) 'fullscreen 'maxmized)
	(run-at-time "2sec" nil
		     (lambda ()
		       (toggle-frame-fullscreen))))
    (require 'fullscreen)
    (fullscreen)))

(provide 'init-startup)

;;; init-startup.el ends here
