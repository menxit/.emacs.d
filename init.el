;; install use-package
(load "~/.emacs.d/lib/install-use-package.el")

;; general preferences
(load "~/.emacs.d/lib/general.el")

;; theme
(use-package twilight-bright-theme
	:ensure t
	:config
	(load-theme 'twilight-bright t))

(global-set-key (kbd "C-c r")  'rename-file-and-buffer)
(global-set-key (kbd "M-o") 'other-window)
