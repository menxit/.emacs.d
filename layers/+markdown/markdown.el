;; markdown
(use-package pandoc-mode
  :ensure t)
(use-package markdown-mode
  :ensure t
  :after (markdown-mode)
  :config
  (setq markdown-command "pandoc"))
