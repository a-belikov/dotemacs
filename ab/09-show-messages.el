
;;Print welcome message

(princ (shell-command-to-string
        (cl-concatenate 'string
                        "(fortune ru ; echo '\n\nЗапуск в "
                        (number-to-string (cadr (time-subtract (current-time) ab-start-time)))
                        " сек.\n"
                        "Сегодня: "
                        (format-time-string "%d %B %Y")
                        "') | cowsay -n -f turtle"
                        ))
(get-buffer-create (current-buffer)))

