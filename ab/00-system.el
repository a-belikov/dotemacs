;; 
;; ab-SYSTEM
;;

;;Set custom-file so that Emacs does not use init.el
(setq custom-file
      "~/.emacs.d/custom.el")

;;Stop Emacs from writing package information to init.el
(setq package--init-file-ensured
      t)


(setq backup-directory-alist `(("." . "~/.saves")))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


(setq large-file-warning-threshold 100000000)



(normal-erase-is-backspace-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(load "server")
(unless (server-running-p) (server-start))


(setq ange-ftp-ftp-program-name "pftp")
(setq ange-ftp-try-passive-mode nil) 
(setq dired-listing-switches "-aBhlF")
(setq dired-listing-switches "-aBhlF --group-directories-first")

(setq user-full-name "Alexey Belikov"
      user-mail-address "a@belikov.tech")

(setq epg-gpg-program "gpg") 
;; (setq epa-pinentry-mode 'loopback)




(setq ranger-override-dired-mode t)

;;  (add-hook 'dired-load-hook  (function (lambda () (load "dired-x"))))







;;Disable menu-bar
(menu-bar-mode 1)

;;Disable tool-bar
(tool-bar-mode -1)

;;Disable scroll-bar
(scroll-bar-mode 1)

;;Activate themes
;; (load-theme 'overcast t)
;; (load-theme 'dracula t)
;; (load-theme 'ample-flat t)
;; (load-theme 'zenburn t )
;; (load-theme 'noctilux t)

;;Set font
(custom-set-faces
 '(default ((t (:height 120)))))



;; /fix
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;; fix