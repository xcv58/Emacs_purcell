<<<<<<< HEAD
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path user-emacs-directory)
;(require 'init-benchmarking) ;; Measure startup time
=======

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

<<<<<<< HEAD
;----------------------------------------------------------------------------
; Bootstrap config
;----------------------------------------------------------------------------
=======
;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
<<<<<<< HEAD
;(require 'init-xterm)
;(require 'init-themes)
;(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-maxframe)
;(require 'init-proxies)
=======
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-proxies)
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
<<<<<<< HEAD
;(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
;(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)
;(require 'init-growl)

(require 'init-editing-utils)

;(require 'init-darcs)
;(require 'init-git)
=======
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)

(require 'init-darcs)
(require 'init-git)
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3

(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-css)
(require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)
(require 'init-sql)

<<<<<<< HEAD
;(require 'init-paredit)
(require 'init-lisp)
;(require 'init-slime)
;(require 'init-clojure)
;(require 'init-common-lisp)
(when *spell-check-support-enabled* (require 'init-spelling))
=======
(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3

(require 'init-marmalade)
(require 'init-misc)

<<<<<<< HEAD
; Extra packages which don't require any configuration
=======
(require 'init-dash)
(require 'init-ledger)
;; Extra packages which don't require any configuration
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3

(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
<<<<<<< HEAD
(when *is-a-mac* (require-package 'osx-location))
=======
(when *is-a-mac*
  (require-package 'osx-location))
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3
(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

<<<<<<< HEAD
;(require 'twilight-anti-bright-theme)
;(load-theme twilight-anti-bright t)
=======
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
<<<<<<< HEAD
=======
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

<<<<<<< HEAD
;(message "init completed in %.2fms" (sanityinc/time-subtract-millis (current-time) before-init-time))


;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; ;'(custom-enabled-themes (quote (twilight-anti-bright)))
; ;'(custom-safe-themes (quote ("9ea054db5cdbd5baa4cda9d373a547435ba88d4e345f4b06f732edbc4f017dc3" default)))
; '(tool-bar-mode nil))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )

;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t
;;; End:
=======
(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
>>>>>>> f685d263a5a1b34acaebcd0ffea253b35a20a9f3
