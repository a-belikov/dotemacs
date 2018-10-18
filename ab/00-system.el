;; 
;; ab-SYSTEM
;;

;;Set custom-file so that Emacs does not use init.el
(setq custom-file
      "~/.emacs.d/custom.el")

;;Stop Emacs from writing package information to init.el
(setq package--init-file-ensured
      t)


(setq make-backup-files t
      vc-make-backup-files t
      version-control t
      kept-new-versions 256
      kept-old-versions 0
      delete-old-versions t
      backup-by-copying t)

(setq backup-dir (concat user-emacs-directory "backup/"))

(if (not (file-exists-p backup-dir))
    (make-directory backup-dir))

(add-to-list 'backup-directory-alist
             `(".*" . ,backup-dir))

(defun force-backup-of-buffer ()
  (setq buffer-backed-up nil))

(add-hook 'before-save-hook 'force-backup-of-buffer)
;; this is what tramp uses
(setq tramp-backup-directory-alist backup-directory-alist)


(setq autosave-dir (concat user-emacs-directory "autosaves/")
      auto-save-list-file-prefix (concat user-emacs-directory "autosave-list"))

(if (not (file-exists-p autosave-dir)) (make-directory autosave-dir t))

(add-to-list 'auto-save-file-name-transforms
             `("\\`/?\\([^/]*/\\)*\\([^/]*\\)\\'" ,(concat autosave-dir "\\2") t))

;; tramp autosaves
(setq tramp-auto-save-directory (concat user-emacs-directory "tramp-autosaves/"))

(if (not (file-exists-p tramp-auto-save-directory))
    (make-directory tramp-auto-save-directory))





(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


(setq large-file-warning-threshold 100000000)



(normal-erase-is-backspace-mode 0)

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





;;  (add-hook 'dired-load-hook  (function (lambda () (load "dired-x"))))





;;Disable menu-bar
(menu-bar-mode -1)

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
