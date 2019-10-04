;;Save startup time
(defvar ab-start-time (current-time))


;; Save cutomization to file
(setq custom-file "~/.emacs.d/custom.el")

;; Additional Repos
;; # # # # # # # # # # #
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)



(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/ab/00-sets.el.org"))
;; (load-file "~/.emacs.d/ab/00-sets.el.el")


;; ligatures
(load-file "~/.emacs.d/ab/10-pragmatapro.el")


;; Config with secret key
(load-file "~/.emacs.d/ab/11-private.el")


;; (load-file "./custom.el")

(set-default-font "Hack")


