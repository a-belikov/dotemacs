;;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;; powerline
;; Declare a list of required packages
(defvar emacs-required-packages
  '(
    ivy
    imenu-list
    anzu
    company
    company-php
    dired-launch
    which-key
    overcast-theme
    color-theme-sanityinc-tomorrow
    doom-themes
    doom-modeline
    web-mode
    php-mode
    angular-mode
    skewer-mode
    phpcbf
    ac-php
    projectile
    nginx-mode
    apache-mode
    magit
    duplicate-thing
    ag
    ripgrep
    dumb-jump
    yasnippet
    yasnippet-snippets
    flycheck
    flymake-php
    rainbow-delimiters
    xah-fly-keys
    org-bullets
    org-caldav
    org-gcal
    oauth2
    htmlize
   )
)
;; (require 'ripgrep)
;;Install required packages
(mapc (lambda (p)
        (package-install p))
      emacs-required-packages)

;;Configure and enable sublimity-mode
;;(require 'sublimity-scroll)
;;(sublimity-mode)

;;Load default auto-complete configs
(ac-config-default)

(setq imenu-list-focus-after-activation t)

;;Set hooks for dired-launch-mode
(add-hook 'dired-mode-hook 'dired-launch-mode)
(add-hook 'after-init-hook 'global-company-mode)

;;Start which-key-mode
(which-key-mode)

;;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)
;; 




(global-flycheck-mode t)

;; (add-hook 'prog-mode-hook 'flycheck-mode)
;; (add-hook 'text-mode-hook 'flycheck-mode)


;; (setq flycheck-phpmd-rulesets '("cleancode"))
(setq flycheck-phpmd-rulesets '("cleancode" "codesize" "controversial" "design" "naming" "unusedcode"))
(setq phpcbf-standard "PSR2")

(add-hook 'php-mode-hook
          (lambda ()
            (setq flycheck-phpcs-standard "PSR2")))
            

(add-hook 'php-mode-hook 'phpcbf-enable-on-save)

(setq php-mode-coding-style (quote psr2))

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             ;; (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
               (define-key php-mode-map  (kbd "M-g") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "M-b") 'ac-php-location-stack-back)    ;go back
               (add-to-list 'company-backends 'company-ac-php-backend)))


(setq bookmark-save-flag 1)


;; Rainbow Delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)




(require 'recentf)
;; (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 250)
(setq recentf-max-saved-items 250)

(doom-modeline-init)
(add-hook 'after-init-hook (lambda () (load-theme 'doom-one t)))






(add-hook 'magit-mode-hook 'xah-fly-insert-mode-activate)


;; (edit-server-start)
