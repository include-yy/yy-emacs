;; Use C-c <left> / <right> to navigate window layouts
(winner-mode 1)


;; Make "C-x o" prompt for a target window when there are more than 2
(lazy-load-unset-keys '("C-x o"))
(lazy-load-global-keys
 '(("C-x o" . ace-window)) "ace-window")

;; Use asdfghjkl to select ace-window's window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


;; Use winum to move between sub-windows
(setq winum-keymap (make-keymap))
(lazy-load-local-keys
 '(("M-0" . winum-select-window-0-or-10)
   ("M-1" . winum-select-window-1)
   ("M-2" . winum-select-window-2)
   ("M-3" . winum-select-window-3)
   ("M-4" . winum-select-window-4)
   ("M-5" . winum-select-window-5)
   ("M-6" . winum-select-window-6)
   ("M-7" . winum-select-window-7)
   ("M-8" . winum-select-window-8))
 winum-keymap
 "winum")

(require 'winum)

(setq winum-format "%s")
(setq winum-mode-line-position 0)
(set-face-attribute 'winum-face nil
		      :foreground "DeepPink"
		      :underline "DeepPink"
		      :weight 'bold)

(winum-mode 1)


;; When splitting window, show (other-buffer) in the new window
(defmacro split-window-func-with-other-buffer (split-function)
  `(lambda (&optional arg)
     "Split this window and switch to the new window unless ARG is provided"
     (interactive "P")
     (funcall ,split-function)
     (let ((target-window (next-window)))
       (set-window-buffer target-window (other-buffer))
       (unless arg
	 (select-window target-window)))))

(lazy-load-unset-keys '("C-x 2" "C-x 3"))
(lazy-load-set-keys
 `(("C-x 2" . ,(split-window-func-with-other-buffer 'split-window-vertically))
   ("C-x 3" . ,(split-window-func-with-other-buffer 'split-window-horizontally))))

(defun sanityinc/toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config"
  (interactive)
  (if (and winner-mode
	   (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

(lazy-load-unset-keys '("C-x 1"))
(lazy-load-set-keys '(("C-x 1" . sanityinc/toggle-delete-other-windows)))

(defmacro split-window-instead (way-func)
  "Kill any other windows and re-split current window in one way.
the current window is on the left/top half of the frame.
way-func can be | or _"
  `(lambda ()
    (interactive)
    (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
      (delete-other-windows)
      (,way-func)
      (when other-buffer
	(set-window-buffer (next-window) other-buffer)))))

(lazy-load-set-keys
 `(("C-x |" . ,(split-window-instead split-window-horizontally))
   ("C-x _" . ,(split-window-instead split-window-vertically))))

(defun toggle-two-split-window ()
  "Toggle two window layout vertically or horizontally."
  (interactive)
  (when (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
           (next-win-buffer (window-buffer (next-window)))
           (this-win-edges (window-edges (selected-window)))
           (next-win-edges (window-edges (next-window)))
           (this-win-2nd (not (and (<= (car this-win-edges)
                                       (car next-win-edges))
                                   (<= (cadr this-win-edges)
                                       (cadr next-win-edges)))))
           (splitter
            (if (= (car this-win-edges)
                   (car (window-edges (next-window))))
                'split-window-horizontally
              'split-window-vertically)))
      (delete-other-windows)
      (let* ((first-win (selected-window)))
        (funcall splitter)
        (if this-win-2nd (other-window 1))
        (set-window-buffer (selected-window) this-win-buffer)
        (set-window-buffer (next-window) next-win-buffer)
        (select-window first-win)
        (if this-win-2nd (other-window 1))))))

(lazy-load-unset-keys '("C-c v" "C-c h"))
(lazy-load-set-keys
 '(("C-c v" . split-window-vertically)
   ("C-c h" . split-window-horizontally)))


(provide 'init-windows)

;;; init-windows.el ends here
