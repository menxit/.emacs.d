;; install use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; avoid to write init.el
(setq custom-file "~/.emacs.d/custom.el")

;; system compy
(setq x-select-enable-clipboard t)

;; numbers
(global-linum-mode t)

;; path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/Library/TeX/texbin")))
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

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

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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

;; which-key
(use-package which-key
  :ensure t
  :config
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (which-key-mode 1))

;; project manager
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-globally-ignored-directories
	(append '(
		  ".git"
		  ".svn"
		  "out"
		  "repl"
		  "target"
		  "venv"
		  "node_modules"
		  )
		projectile-globally-ignored-directories))
  (setq projectile-globally-ignored-files
	(append '(
		  ".DS_Store"
		  "#*#"
		  "*.map"
		  "*.gz"
		  "*.pyc"
		  "*.jar"
		  "*.tar.gz"
		  "*.tgz"
		  "*.zip"
		  )
		projectile-globally-ignored-files))
  (setq projectile-globally-ignored-files ("node_modules" ".git" "#*#" ".DS_Store"))
  (setq projectile-use-native-indexing t)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (setq projectile-require-project-root nil)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-switch-project-action 'projectile-find-dir)
  (setq projectile-find-dir-includes-top-level t))

;; navigation
(use-package treemacs
  :ensure t
  :bind
  (:map global-map
        ([f8] . treemacs))
  :config
  (setq treemacs-no-png-images t)
  (setq treemacs-width 40))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 2)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-banner-logo-title "The Matrix has you...")
  (setq dashboard-items '((projects  . 10)
                          (bookmarks . 5)
                          (recents . 5)
                          (agenda . 5)
                          (registers . 5))))

;; special characters using right alt
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)

;; helm configuration
(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("C-x C-b" . helm-buffers-list)
  ("C-h f" . helm-apropos))

;; poweline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))
