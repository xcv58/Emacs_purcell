(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 80))
           (add-to-list 'default-frame-alist (cons 'width 50)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 8)
                             (frame-char-height)))))))
;;(set-frame-size-according-to-resolution)
(when window-system (set-frame-size (selected-frame) 80 20))
(fset 'yes-or-no-p 'y-or-n-p)
;(display-time-mode 1)
;(setq display-time-24hr-format t) 
;(setq display-time-day-and-date t)
;(mouse-avoidance-mode 'animate)
;(column-number-mode t)
;(scroll-bar-mode nil)
;(setq x-select-enable-clipboard t)
(setq 
 inhibit-startup-message t
 ;; follow symlinks and don't ask
 vc-follow-symlinks t
 display-time-24hr-format t
 display-time-day-and-date t
)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs-saved-places")


(set-default-font "Monaco-28")
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(evil-mode 1)
