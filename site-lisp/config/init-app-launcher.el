;;file format
;;reference: https://wiki.archlinux.org/title/Desktop_entries_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

;;[Desktop Entry]

;; # for comment

;;Type=Application
;;Name=appName
;;Comment=something helpful
;;Exec=Exec-path

(lazy-load-global-keys
 '(("C-c y" . app-launcher-run-app))
 "app-launcher")

(provide 'init-app-launcher)

;;; init-app-launcher.el ends here
