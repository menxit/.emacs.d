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
