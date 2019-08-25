;; install org
(use-package org
  :config
  (setq org-startup-indented t))

;; helm org rifle
(use-package helm-org-rifle
  :ensure t)

;; org dashboard
(use-package org-dashboard
  :ensure t)

;; org bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; all files under ~/org must be added inside org-agenda
(setq org-agenda-files (directory-files-recursively "~/Dropbox/Agenda" "\.org$"))

;; capture
(setq org-capture-templates '(("i" "Inbox" entry
                               (file+headline "~/Dropbox/Agenda/inbox.org" "Inbox")
                               "* TODO %i%?")
			      ("s" "Someday" entry
                               (file+headline "~/Dropbox/Agenda/someday.org" "Someday")
                               "* TODO %i%?")
                              ("t" "Tickler" entry
                               (file+headline "~/Dropbox/Agenda/tickler.org" "Tickler")
                               "* %i%? \nSCHEDULED: %T")))

;; set max-level refile
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-use-outline-path t)
(setq org-refile-allow-creating-parent-nodes 'confirm)


;; org todo
(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; agenda preferences
(setq org-agenda-span 11
      org-agenda-start-on-weekday nil
      org-agenda-start-day "-1d")
