;;;init-linum-mode.el --- don't show linum all the time
;;; -*- coding: utf-8; lexical-binding: t; -*-
;;;Comment:

;; http://stackoverflow.com/questions/3875213/turning-on-linum-mode-when-in-python-c-mode

;;;Code:

(defvar my-linum-inhibit-modes
  '(eshell-mode
    shell-mode
    js-comint-mode
    profiler-report-mode
    ffip-diff-mode
    dictionary-mode
    erc-mode
    dired-mode
    help-mode
    text-mode
    fundamental-mode
    jabber-roster-mode
    jabber-chat-mode
    inferior-js-mode
    inferior-python-mode
    ivy-occur-grep-mode ; better performance
    ivy-occur-mode ; better performance
    twittering-mode
    compilation-mode
    weibo-timeline-mode
    woman-mode
    Info-mode
    calc-mode
    calc-trail-mode
    comint-mode
    gnus-group-mode
    gud-mode
    org-mode
    vc-git-log-edit-mode
    log-edit-mode
    term-mode
    w3m-mode
    speedbar-mode
    gnus-summary-mode
    gnus-article-mode
    calendar-mode)
  "Major modes without line number.")

(when (fboundp 'global-display-line-numbers-mode)
  (defun display-line-numbers-mode-hook-setup ()
    (setq display-line-numbers (and (not (memq major-mode my-linum-inhibit-modes))
				    (not (minibufferp)))))
  (add-hook 'display-line-numbers-mode-hook 'display-line-numbers-mode-hook-setup))

(global-display-line-numbers-mode)

(provide 'init-linum-mode)
;;;init-linum-mode.el ends here
