;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Aakash Sen Sharma"
      user-mail-address "aakashsensharma@gmail.com")

(setq doom-font (font-spec :family "Iosevka Term" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka Term" :size 18))

(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/Documents/org")

(global-set-key (kbd "C-s") 'evil-write)

(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-l") 'evil-window-right)

(global-set-key (kbd "M-g") 'recompile)
(global-set-key (kbd "M-i") 'neotree-show)
(global-set-key (kbd "M-h") '+zen/toggle)

(global-set-key (kbd "M-j") 'drag-stuff-down)
(global-set-key (kbd "M-k") 'drag-stuff-up)
(global-set-key (kbd "M-e") 'execute-extended-command)

(map! :leader
      :desc "Eww browser."
      "e" #'eww)

(use-package! smex)
(use-package! ido-completing-read+)
(use-package! elcord)
(smex-initialize)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(elcord-mode)
