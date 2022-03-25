;;; init-avy.el config for avy -*- lexical-binding:t; -*-

;;(lazy-load-unset-keys '("M-g g"))
(require 'avy)

(lazy-load-global-keys
 '(("C-'" . avy-goto-word-1)
   ("C-;" . avy-goto-word-0))
 "avy")

(defvar init-avy-idle-time 1.5)

(defvar init-avy-timer nil)

(defun init-avy-timer-fun ()
  (interactive)
  (or (and (message "(  ^ω^)")
	   (minibufferp))
      (let* ((a (read-key-sequence-vector nil))
	     (kmd (key-binding a)))
	(cond
	 ((eq kmd 'universal-argument)
	  (prog1 'C-u- (universal-argument)))
	 ((eq kmd 'self-insert-command)
	  (if (char-equal ?` (aref a 0)) (message "")
	    (avy-goto-word-1 (aref a 0))))
	 ((and kmd (commandp kmd))
	  (call-interactively kmd))
	 (t "")))))

(defun init-avy-start-timer ()
  (interactive)
  (setq init-avy-timer
	(run-with-idle-timer init-avy-idle-time
			     t 'init-avy-timer-fun)))

(defun init-avy-end-timer ()
  (interactive)
  (cancel-timer init-avy-timer)
  (setq init-avy-timer nil))

(defun toggle-avy-timer ()
  (interactive)
  (if init-avy-timer
      (progn (init-avy-end-timer)
	     (message "kill avy timer"))
    (progn
      (init-avy-start-timer)
      (message "start avy timer"))))

(global-unset-key (kbd "C-x z"))
(global-set-key (kbd "C-x z") 'toggle-avy-timer)

(provide 'init-avy)

;;; init-avy.el ends here
