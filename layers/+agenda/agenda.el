;; all files under ~/org must be added inside org-agenda
(setq org-agenda-files (quote ("~/org")))

;; org bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
