; -*- mode: lisp -*-

(global-set-key [f12] 'compile)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(browse-url-browser-function (quote browse-url-generic))
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
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
(setq column-number-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'package)

; list the packages we want
(setq package-list '(
                     dracula-theme
                     elixir-mode
                     go-mode
                     haskell-mode
                     jq-mode
                     json-mode
                     markdown-mode
                     org
                     pandoc
                     puppet-mode
                     python
                     ))

; list all package archives directly
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

; activate all packages
(package-initialize)

; fetch list of available packages
(unless package-archive-contents
  (package-refresh-contents))

; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; enable upcase and downcase commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

; autoload Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; visuals - font and theme
(set-default-font "Bitstream Vera Sans Mono")
(load-theme 'dracula)

; org-mode
(require 'org)

(setq org-directory "~/doc/org")
(setq org-default-notes-file (concat org-directory "/capture.org"))
(setq org-journal-file (concat org-directory "/journal.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)
(setq org-agenda-files (list org-directory))
(setq org-refile-targets `((org-agenda-files :maxlevel . 4)))
(setq org-capture-templates
      '(("t" "Todo list item"
         entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal entry"
         entry (file+datetree org-journal-file)
         (file "~/.emacs.d/org-templates/journal.orgcaptmpl"))
        ("m" "MSR entry"
         entry (file+datetree org-journal-file)
         (file "~/.emacs.d/org-templates/msr.orgcaptmpl"))
        ))

; enable org-babel code execution for specific languages
(require 'ob-sh)      ; shell
(require 'ob-python)  ; python

; capture shell stderr output
(setq org-babel-default-header-args:sh
      '((:prologue . "exec 2>&1")
        (:epilogue . ":")))

; TRAMP
(setq tramp-default-method "ssh")

; open links in Chrome
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

; custom functions for journaling
(defun today ()
  "Insert string for today's date."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun head-today ()
  "Insert Markdown header containing today's date."
  (interactive)
  (insert (format-time-string "# %Y-%m-%d")))
