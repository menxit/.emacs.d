;; layers
(load "~/.emacs.d/layers/+emacs/emacs.el")
(load "~/.emacs.d/layers/+theme/theme.el")
(load "~/.emacs.d/layers/+agenda/agenda.el")
(load "~/.emacs.d/layers/+javascript/versioning.el")
(load "~/.emacs.d/layers/+javascript/javascript.el")
(load "~/.emacs.d/layers/+javascript/markdown.el")

;; shortcuts
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c k") 'previous-buffer)
(global-set-key (kbd "C-c l") 'next-buffer)
(global-set-key (kbd "<f12>") 'org-agenda)
