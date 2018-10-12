;; 
;; ab-KEYS
;;






(defvar major-keyboard-bindings
  '(
    ("M-x" . helm-M-x)
    ("C-x C-f" . ido-find-file )
    ("C-x C-r" . helm-recentf)
    ("M-y" . helm-show-kill-ring)
    ("C-x k" . kill-this-buffer)
    ("C-w" . kill-this-buffer)
    ("<M-tab>" . other-window)
    ("C-s" . save-buffer )
    ("C-S-s" . write-file )
    ;; ("C-x d" . deer)
    ("M-S-<down>" . buf-move-down)
    ("M-S-<left>" . buf-move-left)
    ("M-S-<right>" . buf-move-right)
    ("C-r" . emacs-reload-current-file)
    ("C-o" . helm-find-files)
    ("C-f" . isearch-forward)
    ;; ("<escape>" . keyboard-escape-quit)
    ("C-;" . finish-line)
    ("C-d" . duplicate-thing)
    ("C-c w" . copy-word)
    ("C-c s" . copy-string)  
    ("C-c l" . copy-line)
    ("C-c p" . copy-paragraph)
    ("C-S-v" . yank-pop)
    ("C-x b" . bookmark-set)
    ("C-h" . query-replace )
    ("C-M-<up>" . move-line-up)
    ("C-M-<down>" . move-line-down)
    ("C-x g" . magit-status)
    ("C-x s" . ag)
    ("M-d" . xah-delete-backward-char-or-bracket-text)
    ("M-e" . xah-backward-kill-word)
    ("M-r" . xah-kill-word)
    ("M-o" . forward-word)
    ("M-u" . backward-word)
    ("M-h" . xah-beginning-of-line-or-block)
    ("M-;" . xah-end-of-line-or-block)
    ("M-." . dumb-jump-go)
    ("M-," . dumb-jump-back)
    ("<f5>" . run-current-file)
    ("<f8>" . other-frame)
    )
  )
(defun apply-major-keyboard-bindings (pair)
  "Apply keyboard-bindings for supplied list of key-pair values"
  (global-set-key (kbd (car pair))
                  (cdr pair)))

(mapc 'apply-major-keyboard-bindings
      major-keyboard-bindings)



;; set Menu/App key to do emacs's C-x http://ergoemacs.org/emacs/emacs_dvorak_C-x.html
;; (global-set-key (kbd "<menu>") ctl-x-map)
(define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)
(define-key projectile-command-map (kbd "m") 'magit-status)



(global-set-key (kbd "C-1") (lambda ()(interactive) (bookmark-jump "1")))
(global-set-key (kbd "C-2") (lambda ()(interactive) (bookmark-jump "2")))
(global-set-key (kbd "C-3") (lambda ()(interactive) (bookmark-jump "3")))
(global-set-key (kbd "C-4") (lambda ()(interactive)  (bookmark-jump "4")))


(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "C-d") 'isearch-word)



;; Xah fly keys                            
(add-hook 'php-mode-hook
          (function (lambda ()
                      (local-unset-key (kbd "<M-tab>"))
                      (local-unset-key (kbd "C-d"))
                      (local-unset-key (kbd "C-b"))
                      (local-unset-key (kbd "C-h"))
                      (local-unset-key (kbd "C-;"))
)))


(add-hook 'xah-fly-key-hook
          (function (lambda ()
                      (local-unset-key (kbd "<f9>"))
                      (local-unset-key (kbd "C-1"))
                      (local-unset-key (kbd "C-2"))
                      )))

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(define-key xah-fly-key-map (kbd "<f9>") 'run-current-file)

;; (define-key xah-fly-key-map (kbd "`") 'xah-fly-leader-key-map) 
(global-set-key (kbd "`") 'xah-fly-command-mode-activate)
;; (global-set-key (kbd "<tab>") 'xah-fly-command-mode-activate) 
;;(define-key xah-fly-key-map (kbd "<f8>") 'xah-fly-leader-key-map)

;; (define-key xah-fly-key-map (kbd "1") (lambda ()(interactive)  (bookmark-jump "1")))  
;; (define-key xah-fly-key-map (kbd "2") (lambda ()(interactive)  (bookmark-jump "2"))) 
;; (define-key xah-fly-e-keymap (kbd "u") 'calendar)


(add-hook 'xah-fly-command-mode-activate-hook
          (function (lambda ()

                      (local-unset-key (kbd "C-1"))
                      (local-unset-key (kbd "C-2"))
                      (local-unset-key (kbd "<f8>"))
                      (local-unset-key (kbd "<f9>"))

                      (define-key xah-fly-key-map (kbd "1") (lambda ()(interactive)  (bookmark-jump "1")))  
                      (define-key xah-fly-key-map (kbd "2") (lambda ()(interactive)  (bookmark-jump "2")))
                      (define-key xah-fly-key-map (kbd "C-1") (lambda ()(interactive)  (bookmark-jump "1")))
                      (define-key xah-fly-key-map (kbd "C-2") (lambda ()(interactive)  (bookmark-jump "2")))
                      (define-key xah-fly-key-map (kbd "q") 'indent-for-tab-command)                      

                      (define-key xah-fly-key-map (kbd "<menu>") 'xah-fly-insert-mode-activate)
                      (define-key xah-fly-key-map (kbd "<home>") 'xah-fly-insert-mode-activate)
                      (define-key xah-fly-key-map (kbd "g") (kbd "C-g") )

                      ))) 

(add-hook 'xah-fly-insert-mode-activate-hook
          (function (lambda ()
                      
                      (local-unset-key (kbd "1"))
                      (local-unset-key (kbd "2"))
                      (local-unset-key (kbd "<f8>"))
                      (local-unset-key (kbd "<f9>"))

                      (local-unset-key (kbd "g"))                      

                      (define-key xah-fly-key-map (kbd "<menu>") 'xah-fly-command-mode-activate)
                      (define-key xah-fly-key-map (kbd "<home>") 'xah-fly-command-mode-activate)
                      ;; (define-key xah-fly-key-map (kbd "1") )                        
                    )))



(define-key xah-fly-c-keymap (kbd "j") 'helm-recentf)


(define-key xah-fly-comma-keymap (kbd "l") 'dumb-jump-go)
(define-key xah-fly-comma-keymap (kbd "k") 'dumb-jump-back)
(define-key xah-fly-comma-keymap (kbd ".") 'dumb-jump-go)
(define-key xah-fly-comma-keymap (kbd ",") 'dumb-jump-back)
(define-key xah-fly-comma-keymap (kbd "o") 'dumb-jump-go-other-windocomma)
(define-key xah-fly-comma-keymap (kbd "p") 'dumb-jump-go-prompt) 

(define-key xah-fly-comma-keymap (kbd "j") 'find-tag)
(define-key xah-fly-comma-keymap (kbd "a") 'ag)
(define-key xah-fly-comma-keymap (kbd "r") 'rgrep)
;; (define-key xah-fly-c-keymap (kbd "q") 'helm-recentf)

(define-key xah-fly-leader-key-map (kbd "f") 'ibuffer) 

(define-key xah-fly-leader-key-map (kbd "p") 'projectile-command-map)






;; (define-key helm-map (kbd "M-j") 'backward-char)

;; (define-key helm-map (kbd "M-l") 'forward-char) 

;; (define-key helm-map (kbd "M-k") 'helm-next-line)

;; (define-key helm-map (kbd "M-i") 'helm-previous-line)


;; M-i.(tab-to-tab-stop)
;; M-k.(kill-sentence &optional ARG)
;;https://www.alexkorablev.ru/2017/06/10/emacs-got-keys/
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(reverse-input-method 'russian-computer)
