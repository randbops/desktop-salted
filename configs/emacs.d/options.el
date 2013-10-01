(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)

(show-paren-mode t)
(setq kill-whole-line t)

(setq inhibit-splash-screen t)
(setq visible-bell t)
(line-number-mode t)
(column-number-mode t)
(delete-selection-mode t)

(ido-mode t)
(global-linum-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(provide 'options)
