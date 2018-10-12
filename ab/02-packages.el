;;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;; powerline
;; Declare a list of required packages
(defvar emacs-required-packages
  '(helm
    auto-complete
    dired-launch
    which-key
    overcast-theme
    web-mode
    php-mode
    angular-mode
    skewer-mode
    phpcbf
    php-eldoc
    projectile
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


;;Set hooks for dired-launch-mode
(add-hook 'dired-mode-hook
          'dired-launch-mode)

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
;;Enable powerline
;; (powerline-default-theme)


;; (setq powerline-default-separator 'slant)
(setq custom-safe-themes t)

(require 'color-theme-sanityinc-tomorrow)
;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-bright)
(color-theme-sanityinc-tomorrow-eighties )

;; (load-theme 'gruvbox t)

;;Set up helm-mode
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-split-window-in-side-p
      t)



(setq neo-vc-integration nil) 


(setq browse-url-browser-function 'browse-url-chromium)
(setq european-calendar-style 't)

(setq calendar-week-start-day 1
          calendar-day-name-array ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
          calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май" 
                                     "Июнь" "Июль" "Август" "Сентябрь"
                                     "Октябрь" "Ноябрь" "Декабрь"])



;;(global-flycheck-mode t)

(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'flycheck-mode)

 (setq flycheck-phpmd-rulesets '("unusedcode"))

(add-hook 'php-mode-hook 'phpcbf-enable-on-save)
(add-hook 'php-mode-hook 'php-eldoc-enable)


(setq bookmark-save-flag 1)


;; Rainbow Delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)




(require 'recentf)
;; (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 99)



