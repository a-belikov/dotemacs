(defvar pure-command-mode-map (make-keymap) "")

(define-minor-mode pure-command-mode
  "pure-command-mode"
  :lighter "C"
  :keymap  pure-command-mode-map
)

(global-set-key (kbd "C-c c") 'pure-command-mode)

(defvar pure-command-mode-keyboard-bindings
      '(
        ("q" . xah-reformat-lines)
        ("w" . xah-shrink-whitespaces)
        ("'" . xah-cycle-hyphen-underscore-space)
        ("e" . xah-backward-kill-word)
        ("z" . xah-comment-dwim)
        ("x" . hippie-expand)
        ("a" . smex)
        ("n" . ab-swiper)
        ("i" . previous-line)
        ("h" . xah-beginning-of-line-or-block)
        ("d" . xah-delete-backward-char-or-bracket-text)
        ("y" . undo)
        ("u" . backward-word)
        ("j" . backward-char)
        ("g" . keyboard-quit)
        ("c" . xah-copy-line-or-region)
        ("v" . xah-paste-or-paste-previous)
        ("p" . projectile-command-map)
        ("m" . imenu-list-smart-toggle)
        ("l" . forward-char)
        ("s" . open-line)
        ("r" . xah-kill-word)
        ("x" . xah-cut-line-or-region)
        ("o" . forward-word)
        (";" . xah-end-of-line-or-block)
        ("k" . next-line)
        ("f" . ivy-switch-buffer)
        ("," . xah-next-window-or-frame)
        ("b" . xah-toggle-letter-case)
        ("t" . set-mark-command)
        ("-" . universal-argument)


        ("SPC f".find-file)
        ("SPC r" . query-replace)
        ("SPC m" . ranger)

      ))
    
(defun apply-pure-command-mode-keyboard-bindings (pair)
      "Apply keyboard-bindings for supplied list of key-pair values"
      (define-key pure-command-mode-map (kbd (car pair)) (cdr pair)))
      
(mapc 'apply-pure-command-mode-keyboard-bindings pure-command-mode-keyboard-bindings)


(define-key pure-command-mode-map (kbd "i") 'previous-line)
(define-key pure-command-mode-map (kbd "k") 'next-line)
(define-key pure-command-mode-map (kbd "j") 'left-char)
(define-key pure-command-mode-map (kbd "l") 'right-char)
(define-key pure-command-mode-map (kbd "l") 'right-char)
(define-key pure-command-mode-map (kbd "f") 'ivy-switch-buffer)
(define-key pure-command-mode-map (kbd "SPC f") 'find-file)

(add-hook 'pure-command-mode-hook 'pure-command-mode-indication)

(defun pure-command-mode-indication ()
  (interactive)
  "my keys for pure-command-mode."
  (if (bound-and-true-p pure-command-mode)
    (pure-command-mode-turn-on)
  (pure-command-mode-turn-off))
)

(defun pure-command-mode-turn-off ()
  (interactive)
  "turn off."
  (blink-cursor-mode 0)
  (set-cursor-color "#ffffff")
)

(defun pure-command-mode-turn-on ()
  (interactive)
  "turn on."
  (blink-cursor-mode 1)
  (set-cursor-color "#ffff99")
)
