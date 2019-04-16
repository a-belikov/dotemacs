;;Save startup time
(defvar ab-start-time (current-time))


;; Save cutomization to file
(setq custom-file "~/.emacs.d/custom.el")


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;;Load configuration files
;; (load-file "~/.emacs.d/ab/00-system.el")
;; (load-file "~/.emacs.d/ab/01-repositories.el")

;; (load-file "~/.emacs.d/ab/02-packages.el")
;; (load-file "~/.emacs.d/ab/03-settings.el")
;; (load-file "~/.emacs.d/ab/04-keybindings.el")
;; 
(org-babel-load-file (expand-file-name "~/.emacs.d/ab/00-sets.el.org"))

;; Config with secret key
(load-file "~/.emacs.d/ab/11-private.el")

