;; install use-package
(load "~/.emacs.d/lib/install-use-package.el")

;; general preferences
(load "~/.emacs.d/lib/general.el")

;; theme
(use-package twilight-bright-theme
  :ensure t
  :config
  (load-theme 'twilight-bright t))

;; all files under ~/org must be added inside org-agenda
(setq org-agenda-files (quote ("~/org")))

;; shortcuts
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c k") 'previous-buffer)
(global-set-key (kbd "C-c l") 'next-buffer)
(global-set-key (kbd "<f12>") 'org-agenda)
