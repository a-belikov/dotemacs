;; 
;; ab-PACKAGES SETS
;;

(defun finish-line ()
  (interactive)
  (end-of-line)
  (when (not (looking-back ";"))
    (insert ";")))

 

(defun emacs-reload-current-file ()
  "Reload current buffer file from the disk"
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

;;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice 
      t)
(setq initial-scratch-message 
      "")


;;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode 
              nil)

;;Enable show-paren-mode
(show-paren-mode 1)

;;Enable winner-mode
(winner-mode t)

;;Enable windmove
(windmove-default-keybindings 'meta)

;;Show line number on keft side

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(save-place-mode 1)


(projectile-mode +1)                    
;; (setq projectile-project-root-cache-predicate 'file-remote-p)
(setq projectile-mode-line " Projectile ")
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
;; (projectile-global-mode)


;;(require 'server)
;;(unless (server-running-p)
;;  (server-start))


(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;; (eval-after-load 'php-mode           
  ;; (require 'php-extras))


(defun flush-empty-lines()
  "Remove emty string from buffer"
    (interactive)
    (flush-lines "^[[:space:]]*$"))



(defun run-current-file ()
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be php, perl, python, ruby, javascript, bash, ocaml, vb, elisp.
File suffix is used to determine what program to run.
If the file is modified, ask if you want to save first. (This command always run the saved version.)
If the file is emacs lisp, run the byte compiled version if exist."
  (interactive)
  (let (suffixMap fName fSuffix progName cmdStr)

    ;; a keyed list of file suffix to comand-line program path/name
    (setq suffixMap 
          '(("php" . "php")
            ;; ("coffee" . "coffee -p")
            ("pl" . "perl")
            ("py" . "python")
            ("rb" . "ruby")
            ("js" . "node")             ; node.js
            ("sh" . "bash")
            ("ml" . "ocaml")
            ("vbs" . "cscript")))
    (setq fName (buffer-file-name))
    (setq fSuffix (file-name-extension fName))
    (setq progName (cdr (assoc fSuffix suffixMap)))
    (setq cmdStr (concat progName " \""   fName "\""))

    (when (buffer-modified-p)
      (progn 
        (when (y-or-n-p "Buffer modified. Do you want to save first?")
          (save-buffer) ) ) )

    (if (string-equal fSuffix "el") ; special case for emacs lisp
        (progn 
          (load (file-name-sans-extension fName)))
      (if progName
          (progn
            (message "Running…")
            ;; (message progName)
            (shell-command cmdStr "*run-current-file output*" ))
        (message "No recognized program file suffix for this file.")))
    ))

 



;; move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))


;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))









;; Set my-projectile-project-name to projectile-project-name,
;; so that later I can also set projectile project name when in *Messages* buffer etc
(defun my-projectile-switch-project-action ()
  (set-frame-parameter nil 'my-projectile-project-name projectile-project-name)
  (projectile-run-eshell)
  (projectile-find-file))

(setq projectile-switch-project-action 'my-projectile-switch-project-action)



;; Format win-windows title by project name
(setq frame-title-format
    '("Emacs: "
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
           (if (not (string= "-" project-name))
             (format " in [%s]" project-name)
             (format " in [%s]" (frame-parameter nil 'my-projectile-project-name)))))))






(setq auto-save-default nil)

(require 'dired )
(require 'dired-x)

(defun ab-dired-mode-setup ()
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'ab-dired-mode-setup)

(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(setq dired-dwim-target t)


(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file

(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

;; Copy-Past-Advanced  https://www.emacswiki.org/emacs/CopyWithoutSelection

    (defun get-point (symbol &optional arg)
      "get the point"
      (funcall symbol arg)
      (point))
     
    (defun copy-thing (begin-of-thing end-of-thing &optional arg)
      "Copy thing between beg & end into kill ring."
      (save-excursion
        (let ((beg (get-point begin-of-thing 1))
              (end (get-point end-of-thing arg)))
          (copy-region-as-kill beg end))))
     
    (defun paste-to-mark (&optional arg)
      "Paste things to mark, or to the prompt in shell-mode."
      (unless (eq arg 1)
        (if (string= "shell-mode" major-mode)
            (comint-next-prompt 25535)
          (goto-char (mark)))
        (yank)))
     

(defun copy-word (&optional arg)
      "Copy words at point into kill-ring"
       (interactive "P")
       (copy-thing 'backward-word 'forward-word arg)
       ;;(paste-to-mark arg)
     )
 
  (defun copy-line (&optional arg)
      "Save current line into Kill-Ring without mark the line "
       (interactive "P")
       (copy-thing 'beginning-of-line 'end-of-line arg)
;;       (paste-to-mark arg)
     )

  (defun copy-paragraph (&optional arg)
      "Copy paragraphes at point"
       (interactive "P")
       (copy-thing 'backward-paragraph 'forward-paragraph arg)
  ;;     (paste-to-mark arg)
     )









(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))



(setq ido-use-filename-at-point 'guess)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)




;; Crypt org files 
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
;; (setq org-crypt-key nil)

(setq org-crypt-key "3FEE3795")   
(setq epa-file-select-keys nil)



(setq org-support-shift-select t)



(setq org-todo-keywords
'((sequence "TODO" "|" "FEEDBACK" "PROCESS" "DELEGATED" "DONE")))



(setq xah-fly-use-meta-key nil) ; must come before loading xah-fly-keys
(require 'xah-fly-keys)

(xah-fly-keys-set-layout "qwerty") ; required if you use qwerty

(xah-fly-keys 1)



(electric-pair-mode 1)

(skewer-setup)

(setq visible-bell 1)
 (setq ring-bell-function 
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))



(setq background-color (face-attribute 'default :background)) ;; #2d2d2d

(setq fringe-color "#323232")


(defun ab-xfk-command-color ()
  ;; (set-background-color background-color)
  (set-face-background 'fringe fringe-color)
  (global-hl-line-mode 0)

  ;; (set-face-background 'mode-line fringe-color) 
  ;; (set-face-background 'mode-line-inactive fringe-color)
  ;; (shell-command "
;; setxkbmap -layout 'us' &
;; setxkbmap -layout 'us,ru' &
;; setxkbmap -option 'ctrl:nocaps,grp:alt_shift_toggle,grp_led:caps' &
  ;; 
;; xmodmap -e 'keycode 66 = Menu' &
;; ")
)    
(defun ab-xfk-insert-color ()
  ;; (set-background-color "#282828")
  (set-face-background 'fringe "dim gray")
  (global-hl-line-mode 1)
  ;; (set-face-background 'mode-line "#767676") 
  ;; (set-face-background 'mode-line-inactive "#767676")   

  )  


(global-hl-line-mode 0)
(set-face-background hl-line-face "DarkOliveGreen")



(add-hook 'xah-fly-command-mode-activate-hook 'ab-xfk-command-color)
(add-hook 'xah-fly-insert-mode-activate-hook  'ab-xfk-insert-color)

(blink-cursor-mode 0)

(setq skewer-refresh-onsave nil) 

(defun ab-skewer-start-browser-refresh () (interactive) (setq skewer-refresh-onsave t) (run-skewer) )
(defun ab-skewer-stop-browser-refresh () (interactive) (setq skewer-refresh-onsave nil) )
;; In skawer mode refresh linked browser page by save file
(defun my-after-save-actions () "Used refresh" (when skewer-refresh-onsave (skewer-eval "location.reload()" ) ))

(defun skawer-mode-hook-onsave () (add-hook 'after-save-hook 'my-after-save-actions) )

(add-hook 'skewer-mode-hook 'skawer-mode-hook-onsave)
 
 

(defun alarm() (call-process "paplay" "~/.emacs.d/alarm3.wav"))
