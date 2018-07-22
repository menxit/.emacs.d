(use-package solarized-theme
  :ensure t)

(defconst light-theme 'solarized-light)
(defconst dark-theme 'solarized-dark)
(setq current-theme dark-theme)
(defun change-theme-for-lighting ()
  (let* ((current-light-sensor-reading
          (string-to-number
           (shell-command-to-string "~/.emacs.d/lmutracker"))))
    (if (< current-light-sensor-reading 100000)
        (when (not (string-equal current-theme "dark"))
          (load-theme dark-theme 1)
          (setq current-theme "dark"))
      (when (not (string-equal current-theme "light"))
        (load-theme light-theme 1)
        (setq current-theme "light")))))
(run-with-timer 0 5 #'change-theme-for-lighting)

(set-face-attribute 'default nil :height 140)

