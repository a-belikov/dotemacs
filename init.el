;;Save startup time
(defvar ab-start-time (current-time))


;; Save cutomization to file
(setq custom-file "~/.emacs.d/custom.el")

;; load
(load-file "~/.emacs.d/vimode-emacs.init.el")
;; Config with secret key
(load-file "~/.emacs.d/ab/11-private.el")

