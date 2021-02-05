;; Install doom themes package
(use-package doom-themes
  :ensure t)

;; Line height
(setq-default line-spacing 1)

;; Font
(set-frame-font "Monaco 14")

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one-light t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(set-face-attribute 'default nil :height 140)

