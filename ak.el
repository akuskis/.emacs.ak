(load (concat path-to-ak-dir "/fill-column-indicator.el"))
(load (concat path-to-ak-dir "/ak-color.el"))
(load (concat path-to-ak-dir "/ak-finder.el"))
(load (concat path-to-ak-dir "/ak-skeleton.el"))

;; set UTF-8
(set-language-environment 'UTF-8)

;; change backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; bottom panel configuration
(setq size-indication-mode t)
(setq line-number-mode t)
(setq column-number-mode t)

;; use only spaces
(setq tab-width 2)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)

;; configuration for C
(setq c-default-style "linux" c-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; different configurations
(setq cursor-in-non-selected-windows nil)
(setq-default indicate-empty-lines t)
(setq default-major-mode 'text-mode)
(setq-default fill-column 80)

;; show spaces and tabs
(global-hl-line-mode t)
(setq whitespace-style (quote (trailing spaces tabs space-mark tab-mark)))
(setq whitespace-display-mappings
  '((space-mark 32 [183] [46]) ; normal space, ·
    (space-mark 160 [164] [95])
    (space-mark 2208 [2212] [95])
    (space-mark 2336 [2340] [95])
    (space-mark 3616 [3620] [95])
    (space-mark 3872 [3876] [95])
    (newline-mark 10 [182 10]) ; newlne, ¶
    (tab-mark 9 [9655 9] [92 9]))) ; tab, ▷
(global-whitespace-mode t)

;; setup fill-column-indicator
(setq fci-rule-color "red")
(dolist (hook '(python-mode-hook text-mode-hook c++-mode-hook))
  (add-hook hook (lambda () (interactive) (fci-mode))))

;; add functionality
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;; HOOKS
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'copyright-update)
(add-hook 'find-file-hook 'ak-auto-complete)
