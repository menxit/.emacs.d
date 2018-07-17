;; packages repo
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/")
  ("melpa" . "http://melpa.milkbox.net/packages/")))

;; special characters using right alt
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; switch buffer using M-o
(global-set-key (kbd "M-o") 'other-window)

;; helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)

;; packages
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages (quote (helm))))
(custom-set-faces
 )
