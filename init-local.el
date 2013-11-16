(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 ;'(custom-enabled-themes (quote (fogus)))
 ;'(custom-enabled-themes (quote (purple-haze)))
 '(custom-enabled-themes (quote (twilight-anti-bright)))

 ;'(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(when window-system (set-frame-size (selected-frame) 80 20))
(fset 'yes-or-no-p 'y-or-n-p)
(column-number-mode t)
;(scroll-bar-mode nil)
;(display-time-mode 1)
;(setq display-time-24hr-format t)
;(setq display-time-day-and-date t)
;(mouse-avoidance-mode 'animate)
;(setq x-select-enable-clipboard t)
(setq
 default-directory "~/"
 inhibit-startup-message t
 ;; follow symlinks and don't ask
 vc-follow-symlinks t
 display-time-24hr-format t
 display-time-day-and-date t
)


(defun toggle-fullscreen ()
  "Toggle full screen"
   (interactive)
	   (set-frame-parameter
	     nil 'fullscreen
	      (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
;(toggle-full-screen)
;(set-frame-parameter nil 'fullscreen 'fullboth)
;set frame size on start
(setq default-frame-alist
      '((top . 200) (left . 400)
	(width . 80) (height . 24)
	(cursor-type . box)))
(setq initial-frame-alist '((top . 0) (left . 30)))



;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(90 64))
(add-to-list 'default-frame-alist '(alpha 90 64))

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.saved-places-emacs")

;;AUCTeX
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;(setq TeX-PDF-mode t)
;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-master nil)
;(add-hook 'LaTeX-mode-hook
;          (lambda ()
;            (turn-on-reftex)
;            (setq reftex-plug-into-AUCTeX t)))
(setq TeX-PDF-mode t)
(setq TeX-save-query nil)
(setq TeX-view-program-selection
      '(((output-dvi style-pstricks)
         "dvips and PDF Viewer")
        (output-dvi "PDF Viewer")
        (output-pdf "PDF Viewer")
        (output-html "Safari")))
(setq TeX-view-program-list
      '(("dvips and PDF Viewer" "%(o?)dvips %d -o && open %f")
        ("PDF Viewer" "open %o")
        ("Safari" "open %o")))
;(getenv "PATH")
; (setenv "PATH"
;(concat
; "/usr/texbin" ":"
;(getenv "PATH")))

;(global-set-key "\C-\t" 'next-buffer)
;(global-set-key "\C-\S-\t" 'previous-buffer)
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-S-<tab>") 'previous-buffer)
;(global-set-key (kbd "<tab>") 'auto-complete)
;(global-set-key (kbd "<tab>") 'hippie-expand)
;(eval-after-load 'latex '(define-key LaTeX-mode-map [(tab)] 'auto-complete))
(eval-after-load 'latex '(define-key LaTeX-mode-map [(tab)] 'hippie-expand))
(eval-after-load 'java '(define-key java-mode-map [(tab)] 'hippie-expand))
;(eval-after-load 'latex '(define-key LaTeX-mode-map (kbd "<tab>" 'hippie-expand)))
;(eval-after-load 'java '(define-key java-mode-map (kbd "<tab>" 'auto-complete)))
;(eval-after-load 'java '(define-key java-mode-map (kbd "\M-r" 'auto-complete)))
;(define-key java-mode-map "\C-c\C-r" 'auto-complete)
;(eval-after-load 'java '(define-key java-mode-map [(tab)] 'auto-complete))
;(eval-after-load 'Java '(define-key LaTeX-mode-map [(tab)] 'hippie-expand))
;(eval-after-load 'latex '(auto-complete-mode t))
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

(require 'ido)
(ido-mode t)
;; (require 'smex)
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))



;(set-default-font "Monaco-28")
(set-frame-font "Monaco-28")
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(evil-mode 1)

;; Open auto-complete-mode
;;(auto-complete-mode t)
(provide 'init-local)











