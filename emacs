(global-set-key [f12] 'compile)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(inhibit-startup-echo-area-message "phanson")
 '(scroll-bar-mode 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq-default indent-tabs-mode nil)
(global-linum-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun today ()
  "Insert string for today's date."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun head-today ()
  "Insert Markdown header containing today's date."
  (interactive)
  (insert (format-time-string "# %Y-%m-%d")))
