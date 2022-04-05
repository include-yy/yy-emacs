;;; init-native-comp.el native compilation -*- lexical-binding:t; -*-

;; requires emacs 28 and native-comp support
(require 'comp)

;; don't show warnings
(setq native-comp-async-report-warnings-errors nil)

(provide 'init-native-comp)
