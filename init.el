;; install use-package
(load "~/.emacs.d/lib/install-use-package.el")

;; path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; backup file in .emacs.d/.save folder
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; disable-toolbar
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

;; full-screen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; magit
(use-package magit
	:ensure t)

;; project manager
(use-package projectile
	:ensure t
	:config
	(setq projectile-require-project-root nil)
	(projectile-mode 1))

;; helm configuration
(use-package helm
	:ensure t
	:config
	(global-set-key (kbd "M-x") 'helm-M-x)
	(global-set-key (kbd "C-x C-m") 'helm-M-x)
	(global-set-key (kbd "C-x b") 'helm-mini)
	(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
	(global-set-key (kbd "C-h f") 'helm-apropos))

;; which-key
(use-package which-key
	:ensure t
	:config
	(setq which-key-separator " ")
	(setq which-key-prefix-prefix "+")
	(which-key-mode 1))

;; theme
(use-package twilight-bright-theme
	:ensure t
	:config
	(load-theme 'twilight-bright t))

;; dashboard
(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
	(setq dashboard-banner-logo-title "The Matrix has you..."))

;; markdown
(use-package pandoc-mode
	:ensure t)
(use-package markdown-mode
	:ensure t
	:after (markdown-mode)
	:config
		(setq markdown-command "pandoc"))

;; typescript
(use-package company
	:ensure t
	:config
	(setq company-tooltip-align-annotations t))
(use-package tide
	:ensure t
	:after (typescript-mode company flycheck)
	:hook ((typescript-mode . tide-setup)
		(typescript-mode . tide-hl-identifier-mode)
		(before-save . tide-format-before-save))
	:config
	(defun setup-tide-mode ()
		(interactive)
		(tide-setup)
		(flycheck-mode +1)
		(setq flycheck-check-syntax-automatically '(save mode-enabled))
		(eldoc-mode +1)
		(tide-hl-identifier-mode +1)
		(company-mode +1))
	(add-hook 'before-save-hook 'tide-format-before-save)
	(add-hook 'typescript-mode-hook #'setup-tide-mode))

;; rename current buffer
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; switch buffer using M-o
(global-set-key (kbd "M-o") 'other-window)

;; special characters using right alt
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)
