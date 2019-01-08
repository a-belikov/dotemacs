
;;Print welcome message

(princ (shell-command-to-string
        (cl-concatenate 'string
                        "(fortune ; echo '\n\nЗапуск в "
                        (number-to-string (cadr (time-subtract (current-time) ab-start-time)))
                        " сек.\n"
                        "Сегодня: "
                        (format-time-string "%d %B %Y")
                        "'; ) | cowsay -n -f turtle; 
                        echo '\n\n'; 
                        wget -q -O - ru.wttr.in/Ростов-на-Дону?T0
                        "))
       (get-buffer-create (current-buffer)))
