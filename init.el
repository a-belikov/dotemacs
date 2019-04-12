 ;;Save startup time
(defvar ab-start-time (current-time))

;;Load configuration files
(load-file "~/.emacs.d/ab/00-system.el")
(load-file "~/.emacs.d/ab/01-repositories.el")
(load-file "~/.emacs.d/ab/02-packages.el")
(load-file "~/.emacs.d/ab/03-settings.el")
(load-file "~/.emacs.d/ab/04-keybindings.el")
(load-file "~/.emacs.d/ab/09-show-messages.el")


(setenv "GPG_AGENT_INFO")
(load-file "~/.emacs.d/ab/11-private.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120))))
 '(mode-line-buffer-id ((t nil)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," ";")))
 '(package-selected-packages
   (quote
    (php-eldoc php-extras yasnippet-snippets yasnippet ivy jss csv-mode ztree zenburn-theme xah-fly-keys which-key web-mode undo-tree theme-looper sublimity skewer-mode ranger rainbow-delimiters projectile powerline phpcbf php-mode overcast-theme noctilux-theme neotree myterminal-controls meta-presenter material-theme magit indium helm gruvbox-theme flymake-php flycheck duplicate-thing dracula-theme dired-ranger dired-launch darcula-theme color-theme-sanityinc-tomorrow buffer-move auto-complete angular-mode ample-theme ag ace-window ace-jump-mode abyss-theme)))
 '(safe-local-variable-values
   (quote
    ((eval setq orgstruct-heading-prefix-regexp ";;")
     )))))
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-page 'disabled nil)
