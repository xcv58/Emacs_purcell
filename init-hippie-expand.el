(global-set-key (kbd "M-/") 'hippie-expand)
;(global-set-key (kbd "\T") 'hippie-expand)
;
;(defun hippie-unexpand ()
;  (interactive)
;  (hippie-expand 0))
;(define-key read-expression-map [(shift tab)] 'hippie-unexpand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

(provide 'init-hippie-expand)
